#!/usr/bin/awk -f

#************************************************#
# Name  : read_rtd_dsperf.awk
# Author: Miles Dowe
# Date  : Aug. 13th, 2019
#
# Description:
#   Try to get the more useful details out of the
#   horrendous ds_perf file.
#************************************************#

BEGIN {
    FS = "\t"
    OFS = "|" # Use pipes since there are commas in the headers
}

{
    # Print columns I'm more interested in
    print($1,$2,$3,$5,$6,$9,$13,$19,$25,$30,$36,$41,$56);
}
