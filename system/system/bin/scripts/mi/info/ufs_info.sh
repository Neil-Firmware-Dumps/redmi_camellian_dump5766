#!/system/bin/sh

# Set defaults
command=$1
node_name="/proc/mv"
#J19S-QCOM
#ufsid_node="/d/ufshcd0/dump_string_desc_serial"

if [ -f $node_name ];then
	case $command in
	"ufsversion")
		version=`cat $node_name | awk '{print $5}' | sed -n 2p`
		id=`cat $node_name | awk '{print $4}' | sed -n 2p`
		vendor=`cat $node_name | awk '{print $2}' | sed -n 2p`
		echo "$version,$id,$vendor"
		;;
	"ufsid")
#		ufsid_name=`getprop ro.serialno`
		ufsid_name=`cat $node_name | awk -F ':' '{print $2}' | sed -n 3p`
		echo $ufsid_name
		;;
	*)
		echo "$command not support"
		echo "HQ_AutoTest ---$0 --- $command not support"
		;;
	esac
else
	echo "$node_name file no exist"
	echo "HQ_AutoTest ---$0 --- $command --- $node_name file no exist"
	exit 1
fi
