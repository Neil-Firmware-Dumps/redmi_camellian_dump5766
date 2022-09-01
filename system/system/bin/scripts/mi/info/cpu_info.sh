#!/system/bin/sh

#. ./record_logs.sh

# Set defaults
command=$1

case $command in
	"cpuid")
		node_name="/proc/serial_num"
		;;
	"cpufrequency")
		node_name="/proc/cpumaxfreq"
		;;
	"cpufeatureid")
		node_name="/proc/cpu_feature_id"
		;;
	*)
		echo "$command not support"
		echo "HQ_AutoTest --- $0 --- $command --- not support"
		;;
esac

if [ -f $node_name ];then
	echo "HQ_AutoTest --- $0 --- $command --- $node_name file exist"
	case $command in
		"cpufrequency")
			values=`cat $node_name`
			echo "${values}"
			echo "HQ_AutoTest --- $0 --- $command --- ${values}GHz"
			;;
		*)
			values=`cat $node_name`
			echo "$values"
			echo "HQ_AutoTest --- $0 --- $command --- $values"
			;;
	esac
else
	#loginfo "$0 $node_name file no exist"
	echo "$node_name file no exist"
	echo "HQ_AutoTest --- $0 --- $command --- $node_name file no exist"
	exit 1
fi
