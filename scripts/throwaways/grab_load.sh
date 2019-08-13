#!/bin/bash

#************************************************#
# Name  : grab_load.sh
# Author: Miles Dowe
# Date  : Aug. 13th, 2019
#
# Description:
#   Grabs load over time
#************************************************#

COUNT=$((0))
CAP=$((50))
WAIT_TIME=5

while [[ ${COUNT} -ne ${CAP} ]]; do
    w | head -1 >> load_stats.txt

    ((COUNT++))

    sleep ${WAIT_TIME}s
done
