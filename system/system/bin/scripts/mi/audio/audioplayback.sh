#!/system/bin/sh

# Set defaults

case $1 in
        "speaker")
                echo "HQ_AutoTest --- $0 --- $1 --- speaker"
                AudioTest 3 3 3
                if [ $? -ne 0 ];then
                   echo "HQ_AutoTest --- $0 --- $1 --- speaker fail"
                   echo "fail"
                   exit 2
                fi
                echo "HQ_AutoTest --- $0 --- $1 --- close speaker playback"
                echo "pass"
                ;;
        "receiver")
                echo "HQ_AutoTest --- $0 --- $1 --- receiver"
                AudioTest 3 3 4
                if [ $? -ne 0 ];then
                   echo "HQ_AutoTest --- $0 --- $1 --- receiver fail"
                   echo "fail"
                   exit 2
                fi
                echo "HQ_AutoTest --- $0 --- $1 --- close receiver playback"
                echo "pass"
                ;;
        *)
                echo "Unknow Value"
                echo "fail"
                exit 1
                ;;
esac



