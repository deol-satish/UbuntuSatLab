#!/bin/bash
set -x

# ======= LOAD SETTINGS =======
if [ ! -f ../utils/settings.sh ]; then
    echo "Error: settings.sh file not found"
    exit 1
fi
source ../utils/settings.sh

sudo pkill -f apply_tc_rules_best_fq_codel
sudo pkill -f apply_tc_rules_best_codel
sudo pkill -f apply_tc_rules_best_cake
sudo pkill -f apply_tc_rules_best_dualpi2
sudo pkill -f apply_tc_rules_best_fq_pie
sudo pkill -f apply_tc_rules_best_pfifo



sudo pkill -f apply_tc_rules_baseline_fq_codel
sudo pkill -f apply_tc_rules_baseline_codel
sudo pkill -f apply_tc_rules_baseline_cake
sudo pkill -f apply_tc_rules_baseline_dualpi2
sudo pkill -f apply_tc_rules_baseline_fq_pie
sudo pkill -f apply_tc_rules_baseline_pfifo

# ======= FUNCTION TO CLEAN REMOTE DEVICES =======
clean_devices() {
    # Router cleanup
    ssh root@"$router_ipaddr" "
        sudo killall iperf3 tcpdump udp_prague_sender udp_prague_receiver 2>/dev/null
        sudo tc qdisc del dev ens37 root 2>/dev/null
        sudo tc qdisc del dev ens38 root 2>/dev/null
        rm -f *.json *.pcap *udp*.txt *dmesg*.txt
    "

    # Client 1 cleanup
    ssh root@"$client1_ipaddr" "
        sudo killall iperf3 tcpdump udp_prague_sender 2>/dev/null
        rm -f *.json *.pcap *udp*.txt
    "

    # Client 2 cleanup
    ssh root@"$client2_ipaddr" "
        sudo killall iperf3 tcpdump udp_prague_sender 2>/dev/null
        rm -f *.json *.pcap *udp*.txt
    "

    # Server cleanup
    ssh root@"$server_ipaddr" "
        sudo killall iperf3 tcpdump udp_prague_receiver 2>/dev/null
        rm -f *.json *.pcap *udp*.txt
    "
}

# ======= RUN CLEANUP =======
echo "===== Stopping all processes and cleaning devices ====="
clean_devices
echo "===== Reset complete ====="
