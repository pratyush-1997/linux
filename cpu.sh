#!/bin/bash

printf "\n\n Memory\t\t Disk\t\t CPU \n"

MEMORY = $(free -m | awk 'NR==2{printf "%.2f%%\t\t",$3*100/$2 }')

DISK = $(df -h | awk '$NF == "/"{printf "%s\t\t",$5}')

CPU = $(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')

echo "$MEMORY $DISK $CPU"

printf "\n\nNetwork Usage\n"

echo "$(ip -s -h link)"

printf "\n\nActive Logged-in Users\n"

echo "$(who | cut -d' '-f1 | sort | uniq)"
