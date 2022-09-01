#!/system/bin/sh

# Set defaults
node_name="/sys/class/switch/h2w/state"
TP_CONTROL_NOTE_1="/sys/devices/platform/soc/4a88000.spi/spi_master/spi1/spi1.0/fts_irq"
TP_CONTROL_NOTE_2="/sys/devices/platform/soc/4a88000.spi/spi_master/spi1/spi1.1/nvt_irq"

usage(){
        echo "Usage:$0  <audiojack|init|finish>"
        echo "fail"
        exit 1
}

if [ $# -ne 1 ]; then
        usage
fi

command=$1

case $command in
        "audiojack")
                if [ -f $node_name ];then
                        echo "HQ_AutoTest --- $0 --- $node_name file exist"
                        val=`cat $node_name`
                        echo $val
                        echo "HQ_AutoTest --- $0 --- $val"
                else
                        echo "$filename file no exist"
                        echo "fail"
                        exit 1
                fi
                ;;
        "init")
                # 禁用TP
                if [ -f $TP_CONTROL_NOTE_1 ]; then
                        echo 0 > $TP_CONTROL_NOTE_1
                        echo "pass"
                        exit 0
                elif [ -f $TP_CONTROL_NOTE_2 ];then
                        echo 0 > $TP_CONTROL_NOTE_2
                        echo "pass"
                        exit 0
                else
                        echo "HQ_AutoTest --- tp control note not exist!!!"
                        echo "fail"
                        exit 1
                fi
                ;;
        "finish")
                # 启用TP
                if [ -f $TP_CONTROL_NOTE_1 ]; then
                        echo 1 > $TP_CONTROL_NOTE_1
                        echo "pass"
                        exit 0
                elif [ -f $TP_CONTROL_NOTE_2 ];then
                        echo 1 > $TP_CONTROL_NOTE_2
                        echo "pass"
                        exit 0
                else
                        echo "HQ_AutoTest --- tp control note not exist!!!"
                        echo "fail"
                        exit 1
                fi
                ;;
        *)
                echo "$command not support"
                echo "fail"
                exit 1
                ;;
esac
