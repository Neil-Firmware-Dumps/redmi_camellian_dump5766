#!/system/bin/sh

getSize(){
	node_name=$1
	row=$2
	if [ -f $node_name ];then
		echo "HQ_AutoTest --- $command --- $node_name file exist"
		size=`cat $node_name | awk '{print $3}' | sed -n ${row}p`
		echo "${size}GB"
		exit 0
	else
		echo "HQ_AutoTest --- $command --- $node_name file no exist"
		echo "$node_name file no exist"
		exit 1
	fi
}

# Set defaults
command=$1

case $command in
	"ramsize")
		#node_name="/sys/class/huaqin/interface/misc/ram_size"
		node_name="/proc/mv"
		getSize $node_name 1
		;;
	"memorysize")
		#node_name="/sys/class/huaqin/interface/misc/emmc_size"
		node_name="/proc/mv"
		getSize $node_name 2
		;;
	*)
		echo "HQ_AutoTest --- $command not support"
		echo "$command not support"
		;;
esac

#
#if [ -f $node_name ];then
#	echo "HQ_AutoTest --- $command --- $node_name file exist"
#	size=`cat $node_name`
#	echo ${size/B/b}
#else
#	echo "HQ_AutoTest --- $command --- $node_name file no exist"
#	echo "$node_name file no exist"
#	exit 1
#fi
