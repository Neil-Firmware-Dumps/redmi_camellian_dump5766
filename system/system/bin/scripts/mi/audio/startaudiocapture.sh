#!/system/bin/sh

# Set defaults

case $1 in
        "mainmic")
                echo "HQ_AutoTest --- $0 --- $1 --- start capture main mic"
                AudioTest 1 4 1
                if [ $? -ne 0 ];then
                   echo "fail"
                   exit 2
                fi
                echo "HQ_AutoTest --- $0 --- $1 --- end capture main mic"
                echo "pass"
                ;;
        "secmic")
                echo "HQ_AutoTest --- $0 --- $1 --- start capture sub mic"
                AudioTest 2 4 1
                if [ $? -ne 0 ];then
                   echo "fail"
                   exit 2
                fi
                echo "HQ_AutoTest --- $0 --- $1 --- end capture sub mic"
                echo "pass"
                ;;
        "thirdmic")
                echo "Function not supported"
                echo "fail"
                exit 1
                ;;
        *)
                echo "Unknow Value"
                echo "fail"
                exit 1
                ;;
esac



