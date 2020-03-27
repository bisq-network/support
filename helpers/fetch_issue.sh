#!/bin/bash

function get_issue(){
  local issue=$1
  ghi show $issue|awk '/^#[0-9]+:/ {gsub(": .* for trade","");gsub("#","",$1);gh=$1; tradeid=$2} /[Mm]aker.*:.*/ {maker=$2} /[Tt]aker.*:.*/ {taker=$2}END {print gh","tradeid","maker",\n"gh","tradeid","taker","}'
}

if [ "$1" == "" ];then
  echo "usage: $0 <gh issue>"
  exit 1
fi
get_issue $1
