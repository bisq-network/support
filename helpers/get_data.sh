#!/bin/bash

satoshis=100000000

function get_github_issue(){
	local line=$1
	local gh=$(echo $line|cut -d',' -f1)
	echo $gh
}
function get_tradeid(){
	local line=$1
	local tradeid=$(echo $line|cut -d',' -f2)
	echo $tradeid
}
function get_txid(){
	local line=$1
	local txid=$(echo $line|cut -d',' -f3)
	echo $txid
}
function get_reimbursment_address(){
	local line=$1
	local reimb=$(echo $line|cut -d',' -f4)
	echo $reimb
}

function get_tx_info(){
	local gh=$1
	local tradeid=$2
	local txid=$3
	local reimb=$4
	
	mkdir -p log
	curl https://bitaps.com/api/transaction/$txid -o $txid 2> /dev/null
	if [ "$reimb" == "" ];then
		reimb=$(cat $txid|jq '.input[0].address[0]'|tr -d '"')
	fi
	local tradingfee="0$(echo "scale=8;$(cat $txid|jq '.output[0].amount')/$satoshis"|bc -l)"
	local miningfee="0$(echo "scale=8;$(cat $txid|jq '.fee')/$satoshis"|bc -l)"
	echo $gh,$txid,$reimb,$tradingfee,$miningfee,$tradeid	
	mv $txid log
}

#we read the info file and process it line by line, lines with # are ignored
#reimbursement address is optional, if left out the address will be fetched from the blockchain

for line in $(cat info|grep -v '#');do
	gh=$(get_github_issue $line)
	tradeid=$(get_tradeid $line)
	txid=$(get_txid $line)
	reimb=$(get_reimbursment_address $line)
	get_tx_info $gh $tradeid $txid $reimb
done

