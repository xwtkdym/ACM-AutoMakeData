#!/bin/bash
IN_FILE='1.in'
BIN='bin/validator'

function error() {
	echo "$1"
	exit 0
}

function usgae() {
	echo "  -b --bin    default: ${BIN}"
	echo "  -i --ifile  default: ${IN_FILE}"
	echo "  -h --help   get help"
}

ARGS=`getopt -a -o b:i:h -l bin:,ifile:,help -- "$@"`
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
			IN_FILE="$2"
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
[ ! -f ${IN_FILE} ] && error "${IN_FILE} no exist !"

exec $BIN < $IN_FILE
[ $? -ne 0 ] && exit 1
exit 0
