#!/system/bin/sh

# Set defaults
node_name="/sys/class/power_supply/usb/otg_online"

if [ -f $node_name ];then
	echo "HQ_AutoTest --- $0 --- $node_name file exist"
	cat $node_name
else
	echo "fail"
	echo "HQ_AutoTest --- $0 --- $node_name file no exist"
	exit 1
fi
