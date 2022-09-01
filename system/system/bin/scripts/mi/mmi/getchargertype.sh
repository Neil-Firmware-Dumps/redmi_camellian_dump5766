#!/system/bin/sh

# Set defaults
charge_type_node="/sys/class/power_supply/usb/real_type"

if [ -f $charge_type_node ];then
	type=$(cat $charge_type_node)
	echo "$type"
else
	echo "$charge_type_node file no exist"
	echo "HQ_AutoTest --- $0 --- $charge_type_node file no exist"
	exit 1
fi


