#!/system/bin/sh

# Set defaults
node_name=""
command=$1

case $command in
	"typecstatus")
		node_name="/sys/class/power_supply/usb/typec_cc_orientation"
		;;
esac

if [ -f $node_name ];then
	echo "HQ_AutoTest --- $0 --- $node_name file exist"
	cat $node_name
else
	echo "HQ_AutoTest --- $0 --- $filename file no exist"
	echo "fail"
	exit 1
fi
