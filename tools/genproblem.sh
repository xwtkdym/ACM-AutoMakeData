#!/bin/bash
DATA_DIR='data'
WORK_DIR='problem'
NOW_DIR=`pwd`

[ ! -d $DATA_DIR ] && echo "$DATA_DIR no exist!" && exit 1
[ ! -d $WORK_DIR ] && mkdir $WORK_DIR

rm -fr $WORK_DIR/* 2>>/dev/null >>/dev/null
mkdir $WORK_DIR/data
mkdir $WORK_DIR/data/sample
mkdir $WORK_DIR/data/secret

TEX_FILE=files/problem.tex

### sec ### domjudge-problem.ini
timelimit=1
### MB ### problem.yaml
memory_limit=$((512)) 
output_limit=$((512))

### gen domjudge-problem.ini ###
echo "timelimit:\'${timelimit}\'" > $WORK_DIR/domjudge-problem.ini


### gen problem.yaml
PROBLEM_NAME=$(cat $TEX_FILE | grep title)
PROBLEM_NAME=${PROBLEM_NAME#*\{}
PROBLEM_NAME=${PROBLEM_NAME%\}*}
[[ "PROBLEM_NAME" == "" ]] && PROBLEM_NAME="Default Name"
echo "name: $PROBLEM_NAME" > $WORK_DIR/problem.yaml

echo "limits:" >> $WORK_DIR/problem.yaml
echo "    memory: ${memory_limit}" >> $WORK_DIR/problem.yaml
echo "    output: ${output_limit}" >> $WORK_DIR/problem.yaml

### data/secret
cp $DATA_DIR/*.in $WORK_DIR/data/secret
cp $DATA_DIR/*.ans $WORK_DIR/data/secret


### gen problem.pdf
hashval=$(sha256sum $TEX_FILE | cut -d ' ' -f 1)
[ ! -d /tmp/$hashval ] && mkdir /tmp/$hashval
cp $TEX_FILE /tmp/$hashval && cd /tmp/$hashval
xelatex --shell-escape -8bit --interaction=nonstopmode problem.tex 2>>/dev/null >> /dev/null
cd $NOW_DIR

cp /tmp/$hashval/*.pdf $WORK_DIR/problem.pdf
cd $WORK_DIR && zip -9 problem.zip ./*
