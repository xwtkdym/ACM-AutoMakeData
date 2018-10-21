#!/bin/bash
g++ std.cc -w -O3 -o /tmp/std
g++ my.cc -w -O3 -o /tmp/my
g++ data.cc -w -O3 -o /tmp/data
if [ $? != 0 ]
then
	exit
fi
cd /tmp
i=1
while [ $? == 0 ]
do
	echo "====$i===="
	./data > simple.in
	cat simple.in | ./std > std.out
	cat simple.in | ./my > my.out
	diff std.out my.out
	let i=$i+1
done
cat /tmp/std.out
cat /tmp/my.out
