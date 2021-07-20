#!/bin/bash

id=$(printf "%4.4s" $1 | xxd -p)
commit=$(git rev-parse --short=6 HEAD)
if [ $2 -lt 0 ]; then
    power=$(( 256 + $2 ))
else
    power=$2
fi
interval=$3
printf "%.8s%.6s%02x%02x" "${id}" "${commit}" "${power}" "${interval}" \
    | xxd -r -p > config.bin

msp430-elf-objcopy -I binary -O ihex --change-address 0x1000 config.bin config.hex
rm -f config.bin
