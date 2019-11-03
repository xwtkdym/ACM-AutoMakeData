#/bin/bash
BIN='/usr/bin/g++'
FLAG='-O2'

IN_FILE=''
OUT_FILE=''

function error() {
	echo "$1"
	exit 0
}

function usage() {
	echo "  -b --bin      default: ${BIN}"
	echo "  -flag --flag  default path: ${FLAG}"
	echo "  -i --ifile    default: ${IN_FILE}"
	echo "  -o --ofile    default: ${OUT_FILE}"
	echo "  -h --help     get help"
}

ARGS=`getopt -a -o b:flag:i:o:h -l bin:,flag:,ifile:,ofile:,help -- "$@"`
[ $? -ne 0 ] && usage && exit 1

eval set -- "${ARGS}"
while true
do
	case "$1" in
		-b|--bin)
			BIN="$2"
			shift
			;;
		-flag|--flag)
			FLAG="$2"
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
[[ "$IN_FILE" == "" ]] && error "IN_FILE is empty!"
[ ! -f $IN_FILE ] && error "$IN_FILE no exist!"

exec $BIN $FLAG $IN_FILE -o $OUT_FILE

[ $? -ne 0 ] && exit 1
