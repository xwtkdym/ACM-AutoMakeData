#!/bin/bash
g++ std.cc -w -O4 -o /tmp/std
g++ my.cc -w -O4 -o /tmp/my
g++ data.cc -w -O4 -o /tmp/data
if [ $? != 0 ]
then
	exit
fi
cd /tmp
i=1

function out()
{
	echo      "           [[$1]]          "
	echo -e "=============================="
	cat $1
	echo -e "\n==============================\n"
}

while [ $? == 0 ]
do
	echo -n ">>>>>>>>  $i  <<<<<<<"
	./data > simple.in
	cat simple.in | ./std > std.out
	cat simple.in | ./my > my.out
	outstr=$(diff std.out my.out)
	if [[ "$outstr" != "" ]];then
		echo ""
		out simple.in
		out std.out
		out my.out

		exit 0
	fi
	echo " -> Test Ok!!!"
	let i=$i+1
done
