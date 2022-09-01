#!/system/bin/sh

# Set defaults
node_name="/sys/class/huaqin/interface/hw_info/pmic_verison"

if [ -f $node_name ];then
	echo "HQ_AutoTest --- $0 --- $node_name file exist"
	cat $node_name
else
	echo "$node_name file no exist"
	echo "HQ_AutoTest --- $0 --- $node_name file no exist"
	exit 1
fi
