#!/bin/bash
set -x

# Load environment settings
if [ ! -f ../utils/settings.sh ]; then
    echo "Error: settings.sh not found"
    exit 1
fi
source ../utils/settings.sh

# --- Datapoint 1 ---
echo "Applying 244 Mbps, 4 ms, Loss: 8.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 8%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 244mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 1"
sleep 30

# --- Datapoint 2 ---
echo "Applying 632 Mbps, 4 ms, Loss: 0.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 0%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 632mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 2"
sleep 30

# --- Datapoint 3 ---
echo "Applying 248 Mbps, 5 ms, Loss: 8.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 8%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 248mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 3"
sleep 30

# --- Datapoint 4 ---
echo "Applying 214 Mbps, 5 ms, Loss: 10.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 10%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 214mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 4"
sleep 30

# --- Datapoint 5 ---
echo "Applying 839 Mbps, 4 ms, Loss: 0.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 0%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 839mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 5"
sleep 30

# --- Datapoint 6 ---
echo "Applying 246 Mbps, 4 ms, Loss: 8.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 8%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 246mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 6"
sleep 30

# --- Datapoint 7 ---
echo "Applying 241 Mbps, 4 ms, Loss: 8.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 8%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 241mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 7"
sleep 30

# --- Datapoint 8 ---
echo "Applying 214 Mbps, 5 ms, Loss: 10.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 10%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 214mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 8"
sleep 30

# --- Datapoint 9 ---
echo "Applying 238 Mbps, 4 ms, Loss: 9.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 9%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 238mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 9"
sleep 30

# --- Datapoint 10 ---
echo "Applying 226 Mbps, 4 ms, Loss: 9.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 9%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 226mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 10"
sleep 30

# --- Datapoint 11 ---
echo "Applying 214 Mbps, 5 ms, Loss: 10.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 10%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 214mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 11"
sleep 30

# --- Datapoint 12 ---
echo "Applying 214 Mbps, 5 ms, Loss: 10.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 10%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 214mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 12"
sleep 30

# --- Datapoint 13 ---
echo "Applying 214 Mbps, 5 ms, Loss: 10.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 10%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 214mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 13"
sleep 30

# --- Datapoint 14 ---
echo "Applying 1156 Mbps, 4 ms, Loss: 0.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 0%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 1156mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 14"
sleep 30

# --- Datapoint 15 ---
echo "Applying 241 Mbps, 4 ms, Loss: 8.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 8%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 241mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 15"
sleep 30

# --- Datapoint 16 ---
echo "Applying 248 Mbps, 4 ms, Loss: 8.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 8%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 248mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 16"
sleep 30

# --- Datapoint 17 ---
echo "Applying 220 Mbps, 4 ms, Loss: 10.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 10%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 220mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 17"
sleep 30

# --- Datapoint 18 ---
echo "Applying 1391 Mbps, 4 ms, Loss: 0.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 0%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 1391mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 18"
sleep 30

# --- Datapoint 19 ---
echo "Applying 214 Mbps, 5 ms, Loss: 10.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 10%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 214mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 19"
sleep 30

# --- Datapoint 20 ---
echo "Applying 214 Mbps, 5 ms, Loss: 10.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 10%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 214mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 20"
sleep 30

# --- Datapoint 21 ---
echo "Applying 214 Mbps, 5 ms, Loss: 10.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 10%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 214mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 21"
sleep 30

# --- Datapoint 22 ---
echo "Applying 214 Mbps, 5 ms, Loss: 10.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 10%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 214mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 22"
sleep 30

# --- Datapoint 23 ---
echo "Applying 249 Mbps, 4 ms, Loss: 8.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 8%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 249mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 23"
sleep 30

# --- Datapoint 24 ---
echo "Applying 249 Mbps, 4 ms, Loss: 8.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 8%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 249mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 24"
sleep 30

# --- Datapoint 25 ---
echo "Applying 214 Mbps, 5 ms, Loss: 10.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 10%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 214mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 25"
sleep 30

# --- Datapoint 26 ---
echo "Applying 249 Mbps, 4 ms, Loss: 8.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 8%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 249mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 26"
sleep 30

# --- Datapoint 27 ---
echo "Applying 247 Mbps, 4 ms, Loss: 8.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 8%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 247mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 27"
sleep 30

# --- Datapoint 28 ---
echo "Applying 214 Mbps, 5 ms, Loss: 10.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 10%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 214mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 28"
sleep 30

# --- Datapoint 29 ---
echo "Applying 602 Mbps, 5 ms, Loss: 0.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 0%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 602mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 29"
sleep 30

# --- Datapoint 30 ---
echo "Applying 603 Mbps, 5 ms, Loss: 0.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 0%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 603mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 30"
sleep 30

# --- Datapoint 31 ---
echo "Applying 603 Mbps, 5 ms, Loss: 0.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 0%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 603mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 31"
sleep 30

# --- Datapoint 32 ---
echo "Applying 247 Mbps, 4 ms, Loss: 8.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 8%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 247mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 32"
sleep 30

# --- Datapoint 33 ---
echo "Applying 897 Mbps, 4 ms, Loss: 0.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 0%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 897mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 33"
sleep 30

# --- Datapoint 34 ---
echo "Applying 214 Mbps, 5 ms, Loss: 10.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 10%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 214mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 34"
sleep 30

# --- Datapoint 35 ---
echo "Applying 247 Mbps, 4 ms, Loss: 8.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 8%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 247mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 35"
sleep 30

# --- Datapoint 36 ---
echo "Applying 243 Mbps, 4 ms, Loss: 8.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 8%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 243mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 36"
sleep 30

# --- Datapoint 37 ---
echo "Applying 214 Mbps, 5 ms, Loss: 10.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 10%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 214mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 37"
sleep 30

# --- Datapoint 38 ---
echo "Applying 214 Mbps, 5 ms, Loss: 10.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 10%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 214mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 38"
sleep 30

# --- Datapoint 39 ---
echo "Applying 249 Mbps, 5 ms, Loss: 8.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 8%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 249mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 39"
sleep 30

# --- Datapoint 40 ---
echo "Applying 247 Mbps, 4 ms, Loss: 8.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 8%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 247mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 40"
sleep 30

# --- Datapoint 41 ---
echo "Applying 247 Mbps, 4 ms, Loss: 8.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 8%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 247mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 41"
sleep 30

# --- Datapoint 42 ---
echo "Applying 217 Mbps, 4 ms, Loss: 10.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 10%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 217mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 42"
sleep 30

# --- Datapoint 43 ---
echo "Applying 598 Mbps, 5 ms, Loss: 0.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 0%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 598mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 43"
sleep 30

# --- Datapoint 44 ---
echo "Applying 245 Mbps, 4 ms, Loss: 8.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 8%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 245mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 44"
sleep 30

# --- Datapoint 45 ---
echo "Applying 802 Mbps, 4 ms, Loss: 0.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 0%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 802mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 45"
sleep 30

# --- Datapoint 46 ---
echo "Applying 249 Mbps, 5 ms, Loss: 8.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 8%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 249mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 46"
sleep 30

# --- Datapoint 47 ---
echo "Applying 249 Mbps, 5 ms, Loss: 8.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 8%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 249mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 47"
sleep 30

# --- Datapoint 48 ---
echo "Applying 214 Mbps, 5 ms, Loss: 10.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 10%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 214mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 48"
sleep 30

# --- Datapoint 49 ---
echo "Applying 246 Mbps, 4 ms, Loss: 8.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 8%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 246mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 49"
sleep 30

# --- Datapoint 50 ---
echo "Applying 243 Mbps, 4 ms, Loss: 8.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 8%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 243mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 50"
sleep 30

# --- Datapoint 51 ---
echo "Applying 214 Mbps, 5 ms, Loss: 10.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 10%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 214mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 51"
sleep 30

# --- Datapoint 52 ---
echo "Applying 238 Mbps, 4 ms, Loss: 9.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 9%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 238mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 52"
sleep 30

# --- Datapoint 53 ---
echo "Applying 242 Mbps, 4 ms, Loss: 8.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 8%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 242mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 53"
sleep 30

# --- Datapoint 54 ---
echo "Applying 214 Mbps, 5 ms, Loss: 10.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 10%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 214mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 54"
sleep 30

# --- Datapoint 55 ---
echo "Applying 603 Mbps, 5 ms, Loss: 0.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 0%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 603mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 55"
sleep 30

# --- Datapoint 56 ---
echo "Applying 214 Mbps, 5 ms, Loss: 10.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 10%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 214mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 56"
sleep 30

# --- Datapoint 57 ---
echo "Applying 249 Mbps, 4 ms, Loss: 8.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 8%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 249mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 57"
sleep 30

# --- Datapoint 58 ---
echo "Applying 247 Mbps, 4 ms, Loss: 8.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 8%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 247mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 58"
sleep 30

# --- Datapoint 59 ---
echo "Applying 222 Mbps, 4 ms, Loss: 10.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 10%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 222mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 59"
sleep 30

# --- Datapoint 60 ---
echo "Applying 214 Mbps, 5 ms, Loss: 10.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 10%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 214mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 60"
sleep 30

# --- Datapoint 61 ---
echo "Applying 249 Mbps, 4 ms, Loss: 8.0000% with fq_pie"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 8%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: fq_pie"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 249mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: fq_pie"

echo "Completed setup for datapoint 61"
sleep 30

# Cleanup
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
echo "All datapoints processed."
exit 0