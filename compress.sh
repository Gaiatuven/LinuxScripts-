#!/bin/bash

# Check if the user has provided a filename
if [ -z "$1" ]
then
  echo "Usage: $0 [filename]"
  exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]
then
  echo "Error: File '$1' does not exist."
  exit 1
fi

# Compress the file using gzip
gzip "$1"

echo "File '$1' has been compressed."

