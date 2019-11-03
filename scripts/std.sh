#/bin/bash
BIN='bin/std'
IN_FILE='data/1.in'
OUT_FILE='data/1.out'

function error() {
	echo "$1"
	exit 0
}

function usage() {
	echo "  -b --bin     default: ${BIN}"
	echo "  -i --ifile   default: ${IN_FILE}"
	echo "  -o --ofile   default: ${OUT_FILE}"
	echo "  -h --help    get help"
}

ARGS=`getopt -a -o b:i:o:h -l bin:,ifile:,ofile:,help -- "$@"`
[ $? -ne 0 ] && usage && exit 1

eval set -- "${ARGS}"
while true
do
	case "$1" in
		-b|--bin)
			BIN="$2"
			shift
			;;
		-i|--ifile)
			IN_FILE=$2
			shift
			;;
		-o|--ofile)
			OUT_FILE=$2
			shift
			;;
		-h|--help)
			usage && exit 0
			;;
		--)
			break
			;;
	esac
	shift
done
[ ! -f $BIN ] && error "$BIN no exist!"
[ ! -f $IN_FILE ] && error "$IN_FILE no exist!"

exec $BIN < $IN_FILE > $OUT_FILE

[ $? -ne 0 ] && exit 1
