#!/system/bin/sh

# Set defaults
#node_name="/sys/devices/platform/soc/soc:simtray/status"
node_name="/sys/devices/platform/simtray/status"

if [ -f $node_name ];then
	cat $node_name
else
	echo "$node_name file no exist"
	echo "HQ_AutoTest ---$0 --- $node_name file no exist"
	exit 1
fi
