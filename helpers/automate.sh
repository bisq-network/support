#!/bin/bash

helpers_dir="helpers"
fetch_issue="./fetch_issue.sh"
in_helpers_dir=$(pwd|grep 'helpers' -c)
support_file=$(git show :/batch --name-only|tail -n 1)
support_issue=$(echo $support_file|awk -F '[-.]' '{print $2}')
get_data="./get_data.sh"
sed=""
if [ "$(echo $OSTYPE|grep 'darwin.*' -c)" == "1" ];then
  sed=$(which gsed)
  if [ -z $sed  ];then
    echo "Mac OS was detected, but you do not have gsed installed, please install it!"
    echo "exiting ..."
    exit 1
  fi
else 
  sed=$(which sed)
fi

function inform(){
  local text=$1
  echo ">> $text"
}

function ask_user(){
  local question=$1
  inform "$question"
  echo "y/n"
  read input
  if [ "$input" != "y" ];then
    echo "exiting ..."
    exit 1
  fi
}
function test_if_issue_exists(){
  local issue=$1
  if [ $(grep "^$issue," ../${support_file} -c) -ne 0 ];then
    inform "issue $issue already exists, not processing"
    exit 1
  fi
}


if [ "$in_helpers_dir" == "0" ];then
  cd $helpers_dir
fi

inform "using support file $support_file"
echo ""
inform "Please enter issue number (without #) and press enter"
read issue
test_if_issue_exists $issue
inform "fetching issue $issue for you from github"
$fetch_issue $issue > info
inform "dumping info file:"
cat info
ask_user "created info file, does it look ok?"

inform "running get_data for you"

$get_data >> ../$support_file
cd ..

inform "running git diff for you"
git diff
inform "removing lines with null"
$sed -i '/null/d' ${support_file}
inform "running git diff for you"
git diff

inform "adding changes to repository"
git add $support_file
git commit -m "Add txns for fee reimbursement #$issue"

inform "running git log for you after you press enter, please verify all is ok"
read input
git log

ask_user "can I push to git? All looks ok?" 
git push
inform "commenting on the issue"
echo +x
ghi comment -m "Will be reimbursed with #$support_issue" $issue
echo -x
inform "changes commited!"
