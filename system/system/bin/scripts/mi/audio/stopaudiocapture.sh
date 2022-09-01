#!/system/bin/sh

# Set defaults

case $1 in
        "mainmic")
                AudioTest 1 4 0
                if [ $? -ne 0 ];then
                   echo "fail"
                   exit 2
                fi
                echo "HQ_AutoTest --- $0 --- $1 --- stop capture main mic"
                echo "pass"
                ;;
        "secmic")
                AudioTest 2 4 0
                if [ $? -ne 0 ];then
                   echo "fail"
                   exit 2
                fi
                echo "HQ_AutoTest --- $0 --- $1 --- stop capture sec mic"
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



