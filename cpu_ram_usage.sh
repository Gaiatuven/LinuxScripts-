#!/bin/bash
echo 
echo
echo
'"
 ██████╗██████╗ ██╗   ██╗        ██████╗  █████╗ ███╗   ███╗        ██╗   ██╗███████╗ █████╗  ██████╗ ███████╗    ██╗██╗
██╔════╝██╔══██╗██║   ██║        ██╔══██╗██╔══██╗████╗ ████║        ██║   ██║██╔════╝██╔══██╗██╔════╝ ██╔════╝    ██║██║
██║     ██████╔╝██║   ██║        ██████╔╝███████║██╔████╔██║        ██║   ██║███████╗███████║██║  ███╗█████╗      ██║██║
██║     ██╔═══╝ ██║   ██║        ██╔══██╗██╔══██║██║╚██╔╝██║        ██║   ██║╚════██║██╔══██║██║   ██║██╔══╝      ╚═╝╚═╝
╚██████╗██║     ╚██████╔╝███████╗██║  ██║██║  ██║██║ ╚═╝ ██║███████╗╚██████╔╝███████║██║  ██║╚██████╔╝███████╗    ██╗██╗
 ╚═════╝╚═╝      ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝    ╚═╝╚═╝"'
 echo 
 echo 
# Get the current CPU and RAM usage
CPU=$(top -b -n 1 | awk '/%Cpu/{print $2}')
RAM=$(free -m | awk '/Mem/{printf "%.2f", $3/$2*100}')

echo "CPU usage: $CPU%"
echo "RAM usage: $RAM%"

# Get the list of processes sorted by memory usage
PROCESS_LIST=$(ps -eo pid,ppid,%mem,%cpu,cmd --sort=-%mem | head)

# Display the list of processes with high RAM usage
echo "Processes with high RAM usage:"
echo "$PROCESS_LIST"

