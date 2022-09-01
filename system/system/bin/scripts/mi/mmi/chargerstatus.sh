#!/system/bin/sh

# Set defaults
charge_status_node="/sys/class/power_supply/battery/status"

if [ -f $charge_status_node ];then
	status=$(cat $charge_status_node)
	if [ "$status" == "Charging" ];then
		echo "1"
		echo "HQ_AutoTest --- $0 --- $status --- 1"
	else
		echo "0"
		echo "HQ_AutoTest --- $0 --- $status --- 0"
	fi
else
	echo "HQ_AutoTest --- $0 --- $charge_status_node file no exist"
	exit 1
fi


