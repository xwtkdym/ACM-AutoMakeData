#/bin/bash
BIN='bin/generator'
OUT_FILE='1.in'

function error() {
	echo "$1"
	exit 0
}

function usage() {
	echo "  -b --bin     default: ${BIN}"
	echo "  -d --dir     default path: ${DATA_DIR}"
	echo "  -o --ofile   default: ${OUT_FILE}"
	echo "  -h --help    get help"
}

ARGS=`getopt -a -o b:d:o:h -l bin:,dir:,ofile:,help -- "$@"`
[ $? -ne 0 ] && usage && exit 1

eval set -- "${ARGS}"
while true
do
	case "$1" in
		-d|--dir)
			DATA_DIR="$2"
			shift
			;;
		-b|--bin)
			BIN="$2"
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

exec $BIN $RAMDOM > "$OUT_FILE"

[ $? -ne 0 ] && exit 1
exit 0
