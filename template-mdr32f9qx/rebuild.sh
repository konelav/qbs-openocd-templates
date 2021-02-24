#!/bin/bash

BUILD="$1"

BUILD="${BUILD:=release}"

../tools/set_fwinfo.sh
qbs build -d ../build/mdr32f9qx/ profile:arm "$BUILD"
