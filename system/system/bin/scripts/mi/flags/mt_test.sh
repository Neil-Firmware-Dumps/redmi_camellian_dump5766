#!/system/bin/sh

getFlgOrFailItem(){
	command=$1
	flag_node=$2
	fail_note=$3
	if [ -f $flag_node ];then
		echo "pass"
		echo "HQ_AutoTest --- $0 --- $command --- pass"
	else
		if [ -f $fail_note ];then
			val=`cat $fail_note`
			echo $val
			echo "HQ_AutoTest --- $0 --- $command --- fail item: $val"
		else
			echo "NOT TEST"
			echo "HQ_AutoTest --- $0 --- $command --- not test"
		fi
	fi
}

dleFlgOrFailItem(){
	command=$1
	flag_node=$2
	fail_note=$3
	if [ -f $flag_node ];then
		rm -rf $flag_node
		if [ -f $flag_node ];then
			echo "fail"
			echo "HQ_AutoTest --- $0 --- $command --- delete $flag_node fail"
		else
			echo "pass"
		fi
	else
		if [ -f $fail_note ];then
			rm -rf $fail_note
			if [ -f $fail_note ];then
				echo "fail"
				echo "HQ_AutoTest --- $0 --- $command --- delete $fail_note fail"
			else
				echo "pass"
			fi
		else
			echo "pass"
		fi
	fi
}

# Set defaults
command=$1
command2=$2
platform="mtk"


case $command in
	"fqcmt")
		if [ $platform == "qcom" ]; then
			flag_node="/mnt/vendor/persist/FQC.FLG"
			fail_note="/mnt/vendor/persist/FQC_test_info.txt"
			getFlgOrFailItem fqcmt $flag_node $fail_note
		else
			flag_node="/mnt/vendor/nvcfg/PCBA.FLG"
			fail_note="/mnt/vendor/nvcfg/fqccheck_test_info.txt"
			getFlgOrFailItem fqcmt $flag_node $fail_note
		fi
		;;
	"fqcmt_d")
		if [ $platform == "qcom" ]; then
			flag_node="/mnt/vendor/persist/FQC.FLG"
			fail_note="/mnt/vendor/persist/FQC_test_info.txt"
			dleFlgOrFailItem fqcmt_d $flag_node $fail_note
		else
			flag_node="/mnt/vendor/nvcfg/PCBA.FLG"
			fail_note="/mnt/vendor/nvcfg/fqccheck_test_info.txt"
			dleFlgOrFailItem fqcmt_d $flag_node $fail_note
		fi
		;;
	"fmtflag")
		if [ $platform == "qcom" ]; then
			flag_node="/mnt/vendor/persist/FMT.FLG"
			fail_note="/mnt/vendor/persist/FMT_test_info.txt"
			getFlgOrFailItem fmtflag $flag_node $fail_note
		else
			flag_node="/mnt/vendor/nvcfg/FASTTEST.FLG"
			fail_note="/mnt/vendor/nvcfg/fast_test_info.txt"
			getFlgOrFailItem fmtflag $flag_node $fail_note
		fi
		;;
	"fmtflag_d")
		if [ $platform == "qcom" ]; then
			flag_node="/mnt/vendor/persist/FMT.FLG"
			fail_note="/mnt/vendor/persist/FMT_test_info.txt"
			dleFlgOrFailItem fmtflag_d $flag_node $fail_note
		else
			flag_node="/mnt/vendor/nvcfg/FASTTEST.FLG"
			fail_note="/mnt/vendor/nvcfg/fast_test_info.txt"
			dleFlgOrFailItem fmtflag_d $flag_node $fail_note
		fi
		;;
	"mtflag")
		if [ $platform == "qcom" ]; then
			flag_node="/mnt/vendor/persist/MT.FLG"
			fail_note="/mnt/vendor/persist/MT_test_info.txt"
			getFlgOrFailItem mtflag $flag_node $fail_note
		else
			flag_node="/mnt/vendor/nvcfg/MMI1.FLG"
			fail_note="/mnt/vendor/nvcfg/mmi1_test_info.txt"
			getFlgOrFailItem mtflag $flag_node $fail_note
		fi
		;;
	"mtflag_d")
		if [ $platform == "qcom" ]; then
			flag_node="/mnt/vendor/persist/MT.FLG"
			fail_note="/mnt/vendor/persist/MT_test_info.txt"
			dleFlgOrFailItem mtflag_d $flag_node $fail_note
		else
			flag_node="/mnt/vendor/nvcfg/MMI1.FLG"
			fail_note="/mnt/vendor/nvcfg/mmi1_test_info.txt"
			dleFlgOrFailItem mtflag_d $flag_node $fail_note
		fi
		;;
	"rmtflag")
		if [ $platform == "qcom" ]; then
			flag_node="/mnt/vendor/persist/RMT.FLG"
			fail_note="/mnt/vendor/persist/RMT_test_info.txt"
			getFlgOrFailItem rmtflag $flag_node $fail_note
		else
			flag_node="/mnt/vendor/nvcfg/FULL.FLG"
			fail_note="/mnt/vendor/nvcfg/mmicheck_test_info.txt"
			getFlgOrFailItem rmtflag $flag_node $fail_note
		fi
		;;
	"rmtflag_d")
		if [ $platform == "qcom" ]; then
			flag_node="/mnt/vendor/persist/RMT.FLG"
			fail_note="/mnt/vendor/persist/RMT_test_info.txt"
			dleFlgOrFailItem rmtflag_d $flag_node $fail_note
		else
			flag_node="/mnt/vendor/nvcfg/FULL.FLG"
			fail_note="/mnt/vendor/nvcfg/mmicheck_test_info.txt"
			dleFlgOrFailItem rmtflag_d $flag_node $fail_note
		fi
		;;
	"startfmt")
		case $command2 in
			"-reboot")
				delay=$4
				echo "start fmt for next reboot"
				echo "-reboot -delay "$delay>/sdcard/fmt.txt
				echo "pass"
				;;
			"-delay")
				delay=$3
				usleep `expr $delay \* 1000`
				mian_activity="ControlCenterActivity"
				val=`dumpsys activity | grep -i run | grep  ControlCenterActivity`
				if [[ $val == *$mian_activity* ]];then
					echo "pass"
					echo "HQ_AutoTest --- $0 --- startfmt --- main activity Already run"
				else
					val=`am start -n com.huaqin.factory/com.huaqin.factory.ControlCenterActivity | grep "Starting:" | awk '{print $4}'`
					if [[ $val == *$mian_activity* ]];then
						echo "HQ_AutoTest --- $0 --- startfmt --- ControlCenterActivity starting pass"
						usleep `expr $delay \* 1000`
						val=`dumpsys activity | grep -i run | grep  ControlCenterActivity`
						if [[ $val == *$mian_activity* ]];then
							echo "HQ_AutoTest --- $0 --- startfmt --- ControlCenterActivity run pass"
							fast_activity="FastTestAutoStartActivity"
							val=`am start -n com.huaqin.factory/com.huaqin.factory.AutoTest.FastTestAutoStartActivity | grep "Starting:" | awk '{print $4}'`
							if [[ $val == *$fast_activity* ]];then
								echo "pass"
								echo "HQ_AutoTest --- $0 --- startfmt --- FastTestAutoStartActivity Already run，start pass"
							else
								echo "fail"
								echo "HQ_AutoTest --- $0 --- startfmt --- FastTestAutoStartActivity start fail"
							fi
						else
							echo "fail"
							echo "HQ_AutoTest --- $0 --- startfmt --- ControlCenterActivity run fail"
						fi
					else
						echo "fail"
						echo "HQ_AutoTest --- $0 --- startfmt --- ControlCenterActivity starting fail"
					fi
				fi
				;;
			esac
			;;
	*)
		echo "$command not support"
		echo "HQ_AutoTest --- $0 --- $command --- not support"
		;;
esac


