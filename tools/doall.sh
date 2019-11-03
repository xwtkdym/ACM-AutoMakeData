#!/bin/bash
INPUT_SUFFIX='in'
OUTPUT_SUFFIX='ans'
DATA_DIR='data'
BIN_DIR='bin'
N=10
[ ! -d $DATA_DIR ] && mkdir $DATA_DIR
[ ! -d $BIN_DIR ] && mkdir $BIN_DIR

echo "  compile gen ...  "
bash scripts/compiler.sh -i files/generator.cpp -o bin/generator
[ $? -ne 0 ] && exit 0
echo "  compile val ...  "
bash scripts/compiler.sh -i files/validator.cpp -o bin/validator
[ $? -ne 0 ] && exit 0
echo "  compile std ...  "
bash scripts/compiler.sh -i files/std.cpp -o bin/std
[ $? -ne 0 ] && exit 0

for ((i=1;i<$N;++i));
do
	INPUT_FILE="$DATA_DIR/$i.$INPUT_SUFFIX"
	OUTPUT_FILE="$DATA_DIR/$i.$OUTPUT_SUFFIX"
	echo -e -n "\r  Case $i gen input ... "
	bash scripts/generator.sh -b $BIN_DIR/generator -o $INPUT_FILE
	[ $? -ne 0 ] && exit 0
	echo -e -n "\r  Case $i val input ... "
	bash scripts/validator.sh -b $BIN_DIR/validator -i $INPUT_FILE
	[ $? -ne 0 ] && exit 0
	echo -e -n "\r  Case $i gen output ..."
	bash scripts/std.sh -b $BIN_DIR/std -i $INPUT_FILE -o $OUTPUT_FILE
	[ $? -ne 0 ] && exit 0
done
echo ""

bash tools/genproblem.sh 2>>/dev/null >> /dev/null
[ $? -ne 0 ] && exit 1

echo "  Clear tmpfile ...     "
bash scripts/clear.sh
echo "  ok!!!              "
