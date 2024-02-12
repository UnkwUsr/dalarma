#!/bin/bash

export DALARMAS_PATH="/tmp/dalarma/"

# convert sleep duration format to seconds. By
# https://stackoverflow.com/a/50435058/17940925
# (modified)
t2s() {
    printf "%.0f" "$(sed 's/d/*24*3600 +/g; s/h/*3600 +/g; s/m/*60 +/g; s/s/\+/g; s/+[ ]*$//g' <<< "$1" | bc)"
}

calc_remaining_min() {
    sleep_time="$1"
    started_at="$2"

    sleep_secs=$(t2s "$sleep_time")
    start_secs=$(date +%s -ud "1970-01-01 $started_at")
    end_secs=$((start_secs + sleep_secs))

    now_secs=$(date +%s -ud "1970-01-01 $(date +%T)")

    echo $(((end_secs - now_secs) / 60))
}

export -f calc_remaining_min t2s
