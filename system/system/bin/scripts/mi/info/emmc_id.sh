#!/system/bin/sh

# Set defaults
node_name="/sys/block/mmcblk0/device/serial"

if [ -f $node_name ];then
	echo "HQ_AutoTest --- $node_name file exist"
	val= `cat $node_name`
	echo "$val"
	echo "HQ_AutoTest --- $val"
else
	echo "HQ_AutoTest --- $node_name file no exist"
	echo "$filename file no exist"
	exit 1
fi
