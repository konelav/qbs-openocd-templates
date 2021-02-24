#!/bin/bash

IMGPATH="$1"
ADDRESS="$2"

IMGPATH=${IMGPATH:=fw.bin}
ADDRESS=${ADDRESS:=0x08000000}

echo "Uploading to $ADDRESS from $IMGPATH"

openocd -f ./openocd.cfg -c "init; reset init; flash write_image erase $IMGPATH $ADDRESS; exit" || exit -1
