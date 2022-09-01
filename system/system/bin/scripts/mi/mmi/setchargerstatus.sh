#!/system/bin/sh

# Set defaults
charge_enable_node="/sys/class/power_supply/battery/input_suspend"

if [ -f $charge_enable_node ];then
	case $1 in
	"1")
		#1:charge
		echo 0 > $charge_enable_node
		if [ $? -ne 0 ]; then
			echo "HQ_AutoTest --- $0 --- $1 fail"
			echo "fail"
			exit 1
		else
			echo "pass"
		fi
		;;
	"0")
 		#0:discharge
		echo 1 > $charge_enable_node
		if [ $? -ne 0 ]; then
			echo "HQ_AutoTest --- $0 --- $1 fail"
			echo "fail"
			exit 1
		else
			echo "pass"
		fi
		;;
	*)
		echo "HQ_AutoTest --- $0 --- Unknow Value"
		echo "fail"
		exit 1
		;;
	esac
else
	echo "HQ_AutoTest --- $0 --- $charge_enable_node file no exist"
	echo "fail"
	exit 1
fi



