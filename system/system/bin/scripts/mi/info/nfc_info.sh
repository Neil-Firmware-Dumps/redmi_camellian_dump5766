#!/system/bin/sh

# Set defaults
command=$1

case $command in
	"nfccplc")
		val=`dumpsys secure_element | grep "mCplc:" | awk '{print $3}'`
		if [ -n "$val" ];then
			echo $val
		else
			echo "nfc not support"
			echo "HQ_AutoTest --- $0 --- $command --- nfc not support"
		fi
		;;
	"nfcdieid")
		val=`pnscr -p ndi | grep "Die ID" | awk '{print $3}'`
		if [ -n "$val" ];then
			echo $val
		else
			echo "nfc not support"
			echo "HQ_AutoTest --- $0 --- $command --- nfc not support"
		fi
		;;
	*)
		echo "$command not support"
		echo "HQ_AutoTest --- $0 --- $command not support"
		;;
esac
