#!/system/bin/sh

# Set defaults
command=$1
node_name=""

case $command in
	"batteryid")
#		node_name="/sys/class/power_supply/bms/resistance_id"
		node_name="/sys/class/power_supply/battery/battery_id_voltage"
		;;
	"batterytemp")
		node_name="/sys/class/power_supply/battery/temp"
		;;
	"batterycurrent")
		node_name="/sys/class/power_supply/battery/current_now"
		;;
	"batteryvoltage")
		node_name="/sys/class/power_supply/battery/voltage_now"
		;;
	"batterycapacity")
		node_name="/sys/class/power_supply/battery/capacity"
		;;
	*)
		echo "$command not support"
		echo "HQ_AutoTest --- $command not support"
		;;
esac

if [ -f $node_name ];then
	echo "HQ_AutoTest --- $command --- $node_name file exist"
	case $command in
		"batterytemp")
			temp=`cat $node_name`
			val1=`expr $temp / 10`
			val2=`expr $temp % 10`
			echo "${val1}.${val2}"
			echo "HQ_AutoTest --- $0 --- $command --- ${val1}.${val2}"
			;;
		*)
			val=`cat $node_name`
			echo "$val"
			echo "HQ_AutoTest --- $0 --- $command --- $val"
			;;
	esac
	
else
	echo "HQ_AutoTest --- $command --- $filename file no exist"
	exit 1
fi
