#!/bin/bash
set -x

# Load environment settings
if [ ! -f ../utils/settings.sh ]; then
    echo "Error: settings.sh not found"
    exit 1
fi
source ../utils/settings.sh

# --- Datapoint 1 ---
echo "Applying 78 Mbps, 4 ms, Loss: 24.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 24%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 78mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 1"
sleep 30

# --- Datapoint 2 ---
echo "Applying 15 Mbps, 4 ms, Loss: 38.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 38%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 15mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 2"
sleep 30

# --- Datapoint 3 ---
echo "Applying 7 Mbps, 5 ms, Loss: 42.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 42%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 7mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 3"
sleep 30

# --- Datapoint 4 ---
echo "Applying 9 Mbps, 5 ms, Loss: 41.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 41%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 9mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 4"
sleep 30

# --- Datapoint 5 ---
echo "Applying 347 Mbps, 4 ms, Loss: 4.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 4%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 347mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 5"
sleep 30

# --- Datapoint 6 ---
echo "Applying 89 Mbps, 4 ms, Loss: 23.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 23%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 89mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 6"
sleep 30

# --- Datapoint 7 ---
echo "Applying 43 Mbps, 4 ms, Loss: 31.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 31%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 43mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 7"
sleep 30

# --- Datapoint 8 ---
echo "Applying 12 Mbps, 5 ms, Loss: 40.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 40%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 12mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 8"
sleep 30

# --- Datapoint 9 ---
echo "Applying 203 Mbps, 4 ms, Loss: 11.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 11%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 203mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 9"
sleep 30

# --- Datapoint 10 ---
echo "Applying 14 Mbps, 4 ms, Loss: 39.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 39%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 14mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 10"
sleep 30

# --- Datapoint 11 ---
echo "Applying 603 Mbps, 5 ms, Loss: 0.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 0%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 603mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 11"
sleep 30

# --- Datapoint 12 ---
echo "Applying 17 Mbps, 5 ms, Loss: 38.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 38%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 17mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 12"
sleep 30

# --- Datapoint 13 ---
echo "Applying 13 Mbps, 5 ms, Loss: 39.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 39%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 13mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 13"
sleep 30

# --- Datapoint 14 ---
echo "Applying 79 Mbps, 4 ms, Loss: 24.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 24%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 79mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 14"
sleep 30

# --- Datapoint 15 ---
echo "Applying 52 Mbps, 4 ms, Loss: 29.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 29%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 52mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 15"
sleep 30

# --- Datapoint 16 ---
echo "Applying 11 Mbps, 4 ms, Loss: 40.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 40%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 11mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 16"
sleep 30

# --- Datapoint 17 ---
echo "Applying 8 Mbps, 4 ms, Loss: 42.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 42%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 8mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 17"
sleep 30

# --- Datapoint 18 ---
echo "Applying 111 Mbps, 4 ms, Loss: 20.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 20%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 111mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 18"
sleep 30

# --- Datapoint 19 ---
echo "Applying 11 Mbps, 5 ms, Loss: 40.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 40%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 11mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 19"
sleep 30

# --- Datapoint 20 ---
echo "Applying 601 Mbps, 5 ms, Loss: 0.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 0%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 601mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 20"
sleep 30

# --- Datapoint 21 ---
echo "Applying 40 Mbps, 5 ms, Loss: 31.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 31%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 40mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 21"
sleep 30

# --- Datapoint 22 ---
echo "Applying 9 Mbps, 5 ms, Loss: 41.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 41%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 9mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 22"
sleep 30

# --- Datapoint 23 ---
echo "Applying 277 Mbps, 4 ms, Loss: 6.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 6%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 277mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 23"
sleep 30

# --- Datapoint 24 ---
echo "Applying 50 Mbps, 4 ms, Loss: 29.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 29%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 50mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 24"
sleep 30

# --- Datapoint 25 ---
echo "Applying 324 Mbps, 5 ms, Loss: 4.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 4%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 324mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 25"
sleep 30

# --- Datapoint 26 ---
echo "Applying 31 Mbps, 4 ms, Loss: 34.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 34%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 31mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 26"
sleep 30

# --- Datapoint 27 ---
echo "Applying 192 Mbps, 4 ms, Loss: 12.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 12%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 192mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 27"
sleep 30

# --- Datapoint 28 ---
echo "Applying 20 Mbps, 5 ms, Loss: 37.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 37%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 20mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 28"
sleep 30

# --- Datapoint 29 ---
echo "Applying 431 Mbps, 5 ms, Loss: 2.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 2%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 431mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 29"
sleep 30

# --- Datapoint 30 ---
echo "Applying 16 Mbps, 5 ms, Loss: 38.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 38%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 16mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 30"
sleep 30

# --- Datapoint 31 ---
echo "Applying 9 Mbps, 5 ms, Loss: 41.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 41%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 9mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 31"
sleep 30

# --- Datapoint 32 ---
echo "Applying 154 Mbps, 4 ms, Loss: 15.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 15%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 154mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 32"
sleep 30

# --- Datapoint 33 ---
echo "Applying 897 Mbps, 4 ms, Loss: 0.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 0%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 897mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 33"
sleep 30

# --- Datapoint 34 ---
echo "Applying 16 Mbps, 5 ms, Loss: 38.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 38%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 16mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 34"
sleep 30

# --- Datapoint 35 ---
echo "Applying 58 Mbps, 4 ms, Loss: 28.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 28%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 58mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 35"
sleep 30

# --- Datapoint 36 ---
echo "Applying 198 Mbps, 4 ms, Loss: 11.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 11%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 198mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 36"
sleep 30

# --- Datapoint 37 ---
echo "Applying 351 Mbps, 5 ms, Loss: 3.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 3%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 351mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 37"
sleep 30

# --- Datapoint 38 ---
echo "Applying 264 Mbps, 5 ms, Loss: 7.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 7%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 264mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 38"
sleep 30

# --- Datapoint 39 ---
echo "Applying 513 Mbps, 5 ms, Loss: 1.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 1%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 513mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 39"
sleep 30

# --- Datapoint 40 ---
echo "Applying 29 Mbps, 4 ms, Loss: 34.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 34%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 29mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 40"
sleep 30

# --- Datapoint 41 ---
echo "Applying 105 Mbps, 4 ms, Loss: 21.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 21%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 105mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 41"
sleep 30

# --- Datapoint 42 ---
echo "Applying 12 Mbps, 4 ms, Loss: 40.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 40%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 12mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 42"
sleep 30

# --- Datapoint 43 ---
echo "Applying 53 Mbps, 5 ms, Loss: 29.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 29%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 53mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 43"
sleep 30

# --- Datapoint 44 ---
echo "Applying 109 Mbps, 4 ms, Loss: 20.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 20%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 109mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 44"
sleep 30

# --- Datapoint 45 ---
echo "Applying 802 Mbps, 4 ms, Loss: 0.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 0%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 802mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 45"
sleep 30

# --- Datapoint 46 ---
echo "Applying 602 Mbps, 5 ms, Loss: 0.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 0%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 602mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 46"
sleep 30

# --- Datapoint 47 ---
echo "Applying 246 Mbps, 5 ms, Loss: 8.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 8%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 246mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 47"
sleep 30

# --- Datapoint 48 ---
echo "Applying 358 Mbps, 5 ms, Loss: 3.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 3%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 358mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 48"
sleep 30

# --- Datapoint 49 ---
echo "Applying 74 Mbps, 4 ms, Loss: 25.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 25%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 74mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 49"
sleep 30

# --- Datapoint 50 ---
echo "Applying 77 Mbps, 4 ms, Loss: 25.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 25%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 77mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 50"
sleep 30

# --- Datapoint 51 ---
echo "Applying 7 Mbps, 5 ms, Loss: 42.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 42%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 7mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 51"
sleep 30

# --- Datapoint 52 ---
echo "Applying 77 Mbps, 4 ms, Loss: 24.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 24%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 77mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 52"
sleep 30

# --- Datapoint 53 ---
echo "Applying 71 Mbps, 4 ms, Loss: 26.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 26%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 71mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 53"
sleep 30

# --- Datapoint 54 ---
echo "Applying 362 Mbps, 5 ms, Loss: 3.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 3%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 362mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 54"
sleep 30

# --- Datapoint 55 ---
echo "Applying 387 Mbps, 5 ms, Loss: 2.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 2%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 387mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 55"
sleep 30

# --- Datapoint 56 ---
echo "Applying 599 Mbps, 5 ms, Loss: 0.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 0%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 599mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 56"
sleep 30

# --- Datapoint 57 ---
echo "Applying 808 Mbps, 4 ms, Loss: 0.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 0%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 808mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 57"
sleep 30

# --- Datapoint 58 ---
echo "Applying 202 Mbps, 4 ms, Loss: 11.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 11%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 202mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 58"
sleep 30

# --- Datapoint 59 ---
echo "Applying 295 Mbps, 4 ms, Loss: 6.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 6%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 295mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 59"
sleep 30

# --- Datapoint 60 ---
echo "Applying 9 Mbps, 5 ms, Loss: 41.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 5ms loss 41%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 9mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 60"
sleep 30

# --- Datapoint 61 ---
echo "Applying 94 Mbps, 4 ms, Loss: 22.0000% with cake"

# Configure ens37 (delay + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 root handle 1: netem delay 4ms loss 22%"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens37 parent 1:1 handle 2: cake"

# Configure ens38 (rate + AQM)
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 root handle 1: tbf rate 94mbit burst 32kbit latency 100ms"
ssh root@"$router_ipaddr" "sudo tc qdisc add dev ens38 parent 1:1 handle 2: cake"

echo "Completed setup for datapoint 61"
sleep 30

# Cleanup
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens37 root 2>/dev/null || true"
ssh root@"$router_ipaddr" "sudo tc qdisc del dev ens38 root 2>/dev/null || true"
echo "All datapoints processed."
exit 0