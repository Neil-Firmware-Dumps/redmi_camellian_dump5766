#!/system/bin/sh

#. ./../get_logs/get_logs.sh
#loginfo "$0 hello! log is print pass!!!"

# Set defaults
command=$1
platform=qcom

case $command in
	"softwareversion")
		attribute_name="ro.build.display.id"
		getprop $attribute_name
		;;
	"memorytype")
		if [ $platform == "qcom" ]; then
		    memory_type="/proc/memory_type"
		    value=`cat $memory_type`
		    echo "$value"
		else
		    attribute_name="ro.vendor.mtk_emmc_support"
		    var=`getprop $attribute_name`
		    case $var in
			    "1")
				    echo "EMMC"
				    ;;
			    "0")
				    echo "UFS"
				    ;;
			    *)
				    echo "UNKNOW TYPE"
				    ;;
		    esac
		fi
		;;
	"simcardstatus")
		attribute_name="gsm.sim.state"
		var=`getprop $attribute_name`
		if [ "$var" = "READY,ABSENT" ] || [ "$var" = "LOADED,ABSENT" ];then
			echo "1,0"
		elif [ "$var" = "ABSENT,READY" ] || [ "$var" = "ABSENT,LOADED" ];then
			echo "0,1"
		elif [ "$var" = "READY,READY" ] || [ "$var" = "LOADED,LOADED" ];then
			echo "1,1"
		elif [ "$var" = "ABSENT,ABSENT" ];then
			echo "0,0"
		else
			echo "HQ_AutoTest --- $0 --- $command Return value is null, not implemented"
		fi
		;;
	"boardid")
		attribute_name="ro.boot.hwversion"
		getprop $attribute_name
		;;
	"fuse_state")
		attribute_name="ro.boot.efuse"
		getprop $attribute_name
		;;
	*)
		echo "$command not support"
		echo "HQ_AutoTest --- $0 --- $command not support"
		;;
esac

