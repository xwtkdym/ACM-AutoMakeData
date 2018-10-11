#!/bin/bash
#xwtkdym 2018 10 11
i=1
g++ -O3 -w data.cc -o data
g++ -O3 -w std.cc -o std
if [ -d "./alldata" ]
then
	rm -fr ./alldata
fi
mkdir alldata

while [ $i -ne 4 ]
do
	./data > alldata/data${i}.in
	cat alldata/data${i}.in | ./std > alldata/data${i}.out
	let i=${i}+1
done
rm data std
cd alldata
zip upload.zip *
ls -alh | grep upload.zip
