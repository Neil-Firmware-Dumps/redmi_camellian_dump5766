#!/system/bin/sh

# Set defaults
command=$1

case $command in
	"nvbackup")
		command_name="nv_backup"
		val=`which nv_backup`
		if [[ $val == *$command_name* ]]; then
			val=`nv_backup`
			result="pass"
			if [[ $val == *$result* ]]; then
				echo $result
			else
				echo "fail"
				echo "HQ_AutoTest --- $0 --- Nv Backup fail!!!"
			fi
		else
			echo "fail"
			echo "HQ_AutoTest --- $0 --- $command_name not exist!!!"
		fi
		;;
	"nvbackupstatus")
		node_name="/mnt/vendor/persist/NV_BACKUP.FLAG"
		if [ -f $node_name ];then
			echo "1"
			echo "HQ_AutoTest --- $node_name exist"
		else
			echo "0"
			echo "HQ_AutoTest --- $node_name not exist"
		fi
		;;
	*)
		echo "HQ_AutoTest --- $command not support"
		echo "$command not support"
		;;
esac

