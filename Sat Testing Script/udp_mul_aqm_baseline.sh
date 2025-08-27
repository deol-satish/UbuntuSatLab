#!/bin/bash
set -x

# ======= CONFIG =======
AQM_LIST=("fq_codel" "codel" "cake" "fq_pie" "pfifo" "dualpi2")
DURATION=300   # test duration in seconds
TESTNAME_BASE="iperf3_d${DURATION}_baseline"
TIMESTAMP=$(date +"%Y-%m-%d-%H-%M-%S")

# ======= LOAD SETTINGS =======
if [ ! -f ../utils/settings.sh ]; then
    echo "Error: settings.sh file not found"
    exit 1
fi
source ../utils/settings.sh

# ======= FUNCTION TO CLEAN REMOTE DEVICES =======
clean_devices() {
    ssh root@"$router_ipaddr" "sudo killall iperf3; sudo killall tcpdump; sudo killall udp_prague_sender; sudo killall udp_prague_receiver; rm -f *.json *.pcap *udp*.txt *dmesg*.txt"
    ssh root@"$client1_ipaddr" "sudo killall iperf3; sudo killall tcpdump; sudo killall udp_prague_sender; rm -f *.json *.pcap *udp*.txt"
    ssh root@"$client2_ipaddr" "sudo killall iperf3; sudo killall tcpdump; sudo killall udp_prague_sender; rm -f *.json *.pcap *udp*.txt"
    ssh root@"$server_ipaddr" "sudo killall iperf3; sudo killall tcpdump; sudo killall udp_prague_receiver; rm -f *.json *.pcap *udp*.txt"
}

# ======= LOOP OVER EACH AQM =======
for AQM in "${AQM_LIST[@]}"; do
    echo "===== Starting Baseline Test with AQM: $AQM ====="

    # Cleanup before starting
    clean_devices

    # Set TCP congestion control on clients
    ssh root@"$client1_ipaddr" "sudo sysctl -w net.ipv4.tcp_congestion_control=$tcp1"
    ssh root@"$client2_ipaddr" "sudo sysctl -w net.ipv4.tcp_congestion_control=$tcp2"

    ssh root@"$client1_ipaddr" "sudo sysctl -w net.ipv4.tcp_ecn=$tcp1_ecn"
    ssh root@"$client2_ipaddr" "sudo sysctl -w net.ipv4.tcp_ecn=$tcp2_ecn"

    ssh root@"$router_ipaddr" "sudo sysctl -w net.ipv4.tcp_ecn=1"
    ssh root@"$server_ipaddr" "sudo sysctl -w net.ipv4.tcp_ecn=1"

    # Start iperf3 server and UDP Prague receiver
    ssh root@"$server_ipaddr" "nohup iperf3 -s -p 5102 -J > iperf3_server_${tcp2}_${TESTNAME_BASE}_${AQM}.json 2>&1 &"
    ssh root@"$server_ipaddr" "stdbuf -oL ./udp_prague/udp_prague_receiver -p 5106 > udp_prague_receiver_${TESTNAME_BASE}_${AQM}.json" &

    # Start tcpdump
    ssh root@"$server_ipaddr" "sudo nohup tcpdump -i ens37 -w pcap_server_${TESTNAME_BASE}_${AQM}.pcap > /dev/null 2>&1 &"

    sleep 2

    # Start applying tc rules for this AQM
    nohup ./scripts/apply_tc_rules_baseline_${AQM}.sh > output_${AQM}.txt 2>&1 < /dev/null &
    tc_pid=$!
    echo "apply_tc_rules_baseline_${AQM}.sh running with PID $tc_pid"
    sleep 20

    # Start clients
    ssh root@"$client2_ipaddr" "iperf3 -c 192.168.2.2 -t $DURATION -p 5102 -J > iperf3_client_${tcp2}_${TESTNAME_BASE}_${AQM}.json" &
    ssh root@"$client1_ipaddr" "stdbuf -oL ./udp_prague/udp_prague_sender -a 192.168.2.2 -p 5106 -c > udp_prague_sender_${TESTNAME_BASE}_${AQM}.txt" &

    echo "Traffic started for $AQM"
    sleep $DURATION

    ssh root@"$router_ipaddr" "sudo killall iperf3;sudo killall tcpdump;" 
    ssh root@"$client1_ipaddr" "sudo killall iperf3;sudo killall tcpdump;sudo killall udp_prague_sender;"
    ssh root@"$client2_ipaddr" "sudo killall iperf3;sudo killall tcpdump;sudo killall udp_prague_sender;"
    ssh root@"$server_ipaddr" "sudo killall iperf3;sudo killall tcpdump;sudo killall udp_prague_receiver;"


    # Create results folder for this AQM
    base_dir="./data/udp_net_${TIMESTAMP}_baseline_${AQM}"
    mkdir -p "$base_dir"

    # Save dmesg from router
    ssh root@"$router_ipaddr" "dmesg > dmesg_${TESTNAME_BASE}_${AQM}_${TIMESTAMP}.txt"

    # Copy all files
    scp root@"$server_ipaddr":*.json "$base_dir"/
    scp root@"$server_ipaddr":*.pcap "$base_dir"/
    scp root@"$server_ipaddr":*.txt "$base_dir"/
    scp root@"$client1_ipaddr":*.json "$base_dir"/
    scp root@"$client2_ipaddr":*.json "$base_dir"/
    scp root@"$client1_ipaddr":*.txt "$base_dir"/
    scp root@"$client2_ipaddr":*.txt "$base_dir"/
    scp root@"$router_ipaddr":*dmesg*.txt "$base_dir"/

    echo "Data saved for $AQM at $base_dir"

    # Kill background tc script
    kill "$tc_pid" 2>/dev/null

    # Kill everything
    clean_devices

done

echo "===== All AQM Baseline tests completed ====="
exit 0
