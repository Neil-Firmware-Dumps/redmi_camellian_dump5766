#!/system/bin/sh

# Set defaults
# tp_control_value： [0]:禁用TP, [1]:启用TP
TP_CONTROL_NOTE_1="/sys/devices/platform/soc/4a88000.spi/spi_master/spi1/spi1.0/fts_irq"
TP_CONTROL_NOTE_2="/sys/devices/platform/soc/4a88000.spi/spi_master/spi1/spi1.1/nvt_irq"

tp_control_value=$1

if [ -f $TP_CONTROL_NOTE_1 ]; then
    echo $tp_control_value > $TP_CONTROL_NOTE_1
    echo "pass"
    exit 0
elif [ -f $TP_CONTROL_NOTE_2 ];then
    echo $tp_control_value > $TP_CONTROL_NOTE_2
    echo "pass"
    exit 0
else
    echo "HQ_AutoTest --- tp control note not exist!!!"
    echo "fail"
    exit 1
fi
