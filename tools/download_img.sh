#!/bin/bash

SIZE="$1"
IMGPATH="$2"
ADDRESS="$3"

SIZE=`expr ${SIZE:=1024} \* 1024`
IMGPATH=${IMGPATH:=fw.bin}
ADDRESS=${ADDRESS:=0x08000000}

echo "Downloading $SIZE byte(s) starting from $ADDRESS to $IMGPATH"

openocd -f ./openocd.cfg -c "init; reset init; dump_image $IMGPATH $ADDRESS $SIZE; exit" || exit -1
