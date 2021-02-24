#!/bin/bash

FWPATH="$1"

read -p " => Connect programmer to device and press ENTER" dummy
echo "    *** Flashing firmware $FWPATH..."
openocd -f ./openocd.cfg -c "program $FWPATH verify reset exit" || exit -1
#openocd -f ./openocd.cfg -c "program $FWPATH reset exit" || exit -1
