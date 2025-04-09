#!/bin/bash

if [ -e /sys/firmware/acpi/tables/MSDM ]; then
    key=$(sudo strings /sys/firmware/acpi/tables/MSDM | grep -oP '[A-Z0-9]{5}-[A-Z0-9]{5}-[A-Z0-9]{5}-[A-Z0-9]{5}-[A-Z0-9]{5}' | head -1)
    
    if [ -n "$key" ]; then
        echo "$key" > key.txt
        echo "Key saved to key.txt"
    else
        echo "No key found in the MSDM table" >&2
        exit 1
    fi
else
    echo "MSDM table not found - System does not have an embedded OEM key" >&2
    exit 1
fi

# chmod +x get_key.sh
# sudo ./get_key.sh
