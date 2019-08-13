#!/bin/bash

#************************************************#
# Name  : sum_check_files.sh
# Author: Miles Dowe
# Date  : Aug. 8th, 2019
#
# Description:
#   Sums connections from the series of open files
#   made by check_file_issue.sh.
#************************************************#

FILES=`ls`

for FILE in ${FILES}; do
    SUM=`cat ${FILE} | grep "ncube-lm" | awk '{sum += $1} END {print sum}'`
    echo "${FILE} = ${SUM}"
done

exit 0
