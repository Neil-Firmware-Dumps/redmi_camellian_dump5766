#!/system/bin/sh

# Set defaults

case $1 in
        "hsmic2spk")
                echo "Function not supported"
                echo "fail"
                exit 4
                ;;
        "hsmic2rec")
                case $2 in
                        "0")
                                AudioTest 3 1 0
                                if [ $? -ne 0 ];then
                                   echo "fail"
                                   exit 2
                                fi
                                echo "HQ_AutoTest --- $0 --- $1 --- close headset mic to receiver loopback"
                                echo "pass"
                                ;;
                        "1")
                                AudioTest 3 1 1
                                if [ $? -ne 0 ];then
                                   echo "fail"
                                   exit 2
                                fi
                                echo "HQ_AutoTest --- $0 --- $1 --- open headset mic to receiver loopback"
                                echo "pass"
                                ;;
                        *)
                                echo "HQ_AutoTest --- $0 --- $1 --- hsmic2rec Unknow Value"
                                echo "fail"
                                exit 3
                                ;;
                esac
                ;;
        "mainmic2headphone")
                case $2 in
                        "0")
                                AudioTest 1 2 0
                                if [ $? -ne 0 ];then
                                   echo "fail"
                                   exit 2
                                fi
                                echo "HQ_AutoTest --- $0 --- $1 --- close MainMic to headset loopback"
                                echo "pass"
                                ;;
                        "1")
                                AudioTest 1 2 1
                                if [ $? -ne 0 ];then
                                   echo "fail"
                                   exit 2
                                fi
                                echo "HQ_AutoTest --- $0 --- $1 --- open MainMic to headset loopback"
                                echo "pass"
                                ;;
                        *)
                                echo "HQ_AutoTest --- $0 --- $1 --- mainmic2headphone Unknow Value"
                                echo "fail"
                                exit 3
                                ;;
                esac
                ;;
        "secmic2headphone")
                case $2 in
                        "0")
                                AudioTest 2 2 0
                                if [ $? -ne 0 ];then
                                   echo "fail"
                                   exit 2
                                fi
                                echo "HQ_AutoTest --- $0 --- $1 --- close SubMic to headset loopback"
                                echo "pass"
                                ;;
                        "1")
                                AudioTest 2 2 1
                                if [ $? -ne 0 ];then
                                   echo "fail"
                                   exit 2
                                fi
                                echo "HQ_AutoTest --- $0 --- $1 --- open SubMic to headset loopback"
                                echo "pass"
                                ;;
                        *)
                                echo "HQ_AutoTest --- $0 --- $1 --- secmic2headphone Unknow Value"
                                echo "fail"
                                exit 3
                                ;;
                esac
                ;;
        "thirdmic2headphone")
                echo "Function not supported"
                echo "fail"
                exit 4
                ;;
        *)
                echo "Unknow Value"
                echo "fail"
                exit 1
                ;;
esac



