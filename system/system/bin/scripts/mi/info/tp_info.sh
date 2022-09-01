#!/system/bin/sh

# Set defaults
command=$1

node_name="/proc/tp_lockdown_info"

if [ -f $node_name ];then
	echo "HQ_AutoTest ---$0 --- $command --- $node_name file exist"
	case $command in
	"tplockdowninfo")
		cat $node_name
		;;
	"tpcolor")
		color=`cat $node_name`
		case ${color:5:1} in
		"1")
			echo "white"
			;;
		"2")
			echo "black"
			;;
		*)
			echo "fail"
			;;
		esac
		;;
	*)
		echo "$command not support"
		echo "HQ_AutoTest ---$0 --- $command not support"
		;;
	esac
else
	echo "HQ_AutoTest ---$0 --- $command --- $node_name file no exist"
	echo "$node_name file no exist"
fi
