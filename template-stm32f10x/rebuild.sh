#!/bin/bash

BUILD="$1"

BUILD="${BUILD:=release}"

../tools/set_fwinfo.sh
qbs build -d ../build/stm32f10x/ profile:arm "$BUILD"
