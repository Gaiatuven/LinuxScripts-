#!/bin/bash

# Check network connectivity
ping -c 1 google.com >/dev/null 2>&1
if [ $? -eq 0 ]
then
  echo "Network is up."
else
  echo "Network is down."
  exit 1
fi

# Ping a remote host
read -p "Enter the IP address or hostname of the remote host: " host
ping -c 3 "$host" >/dev/null 2>&1
if [ $? -eq 0 ]
then
  echo "Remote host is up."
else
  echo "Remote host is down."
  exit 1
fi

