#!/bin/bash

BUILD="$1"

BUILD="${BUILD:=release}"

../tools/set_fwinfo.sh
qbs build -d ../build/mdr1986ve1t/ profile:arm "$BUILD"
