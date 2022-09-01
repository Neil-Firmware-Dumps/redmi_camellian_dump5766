#!/system/bin/sh

function sd_card_resize() {
	sd_size_k=$1
	if [ $sd_size_k -gt `expr 64 \* 1024 \* 1024` ];then
		sd_size_k=`expr 128 \* 1024 \* 1024`
	elif [ $sd_size_k -gt `expr 32 \* 1024 \* 1024` ];then
		sd_size_k=`expr 64 \* 1024 \* 1024`
	elif [ $sd_size_k -gt `expr 16 \* 1024 \* 1024` ];then
		sd_size_k=`expr 32 \* 1024 \* 1024`
	elif [ $sd_size_k -gt `expr 8 \* 1024 \* 1024` ];then
		sd_size_k=`expr 16 \* 1024 \* 1024`
	elif [ $sd_size_k -gt `expr 4 \* 1024 \* 1024` ];then
		sd_size_k=`expr 8 \* 1024 \* 1024`
	elif [ $sd_size_k -gt `expr 2 \* 1024 \* 1024` ];then
		sd_size_k=`expr 4 \* 1024 \* 1024`
	elif [ $sd_size_k -gt `expr 1024 \* 1024` ];then
		sd_size_k=`expr 2 \* 1024 \* 1024`
	elif [ $sd_size_k -gt `expr 512 \* 1024` ];then
		sd_size_k=`expr 1024 \* 1024`
	elif [ $sd_size_k -gt `expr 256 \* 1024` ];then
		sd_size_k=`expr 512 \* 1024`
	elif [ $sd_size_k -gt `expr 128 \* 1024` ];then
		sd_size_k=`expr 256 \* 1024`
	else
		sd_size_k=0
	fi

	echo "${sd_size_k}kb"
}

# Set defaults
node_name="/proc/partitions"

if [ -f $node_name ];then
	echo "HQ_AutoTest ---$0 --- $node_name file exist"
	val=`cat $node_name | grep "mmcblk"`
	if [[ "$val" == *"mmcblk"* ]];then
		val=`echo $val | grep "mmcblk" | sed -n '1p' | awk '{print $3}'`
		echo "${val}kb"
	else
		echo "0"
	fi
else
	echo "$filename file no exist"
	echo "HQ_AutoTest ---$0 --- $node_name file no exist"
	exit 1
fi
