#!/system/bin/sh

# Set defaults
#node_name="/sys/devices/platform/charger/ADC_Charger_Voltage"
node_name="/sys/class/power_supply/usb/voltage_now"

if [ -f $node_name ];then
	cat $node_name
else
	echo "$node_name file no exist"
	echo "HQ_AutoTest ---$0 --- $command --- $node_name file no exist"
	exit 1
fi
