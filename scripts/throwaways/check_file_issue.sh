#!/bin/bash

#************************************************#
# Name  : check_file_issue.sh
# Author: Miles Dowe
# Date  : Aug. 7, 2019
#
# Description:
#   Production encountering too many open files.
#   This routine will send details to a DEV server
#   for further investigation.
#************************************************#

CAP=$((40)) # The number of times to run this

OUT_DIR=/home/chse.mdowe/open_files

AMOUNT=$((0))
while [[ ${AMOUNT} -ne ${CAP} ]]; do
    # Get a list of open files (sum duplicates) owned by a process
    lsof | awk '{print $10 ", " $2}' | sort | uniq -c > ${OUT_DIR}/open_files_${AMOUNT}.txt

    # Increment the counter
    ((AMOUNT++))

    # Wait for 30 minutes before trying again
    sleep 30m
done
