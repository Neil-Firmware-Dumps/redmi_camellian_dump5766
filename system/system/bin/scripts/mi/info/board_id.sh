#!/system/bin/sh

#. ./record_logs.sh

# Set defaults
node_name="/sys/class/huaqin/interface/hw_info/pcba_config"

if [ -f $node_name ];then
	val=`cat $node_name`
	echo "$val"
	echo "HQ_AutoTest --- $0 --- $1 --- $val"
else
	echo "$node_name file no exist"
	echo "HQ_AutoTest --- $0 --- $1 --- $node_name file no exist"
	exit 1
fi
