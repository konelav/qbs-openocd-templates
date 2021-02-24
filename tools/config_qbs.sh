#!/bin/bash

GCC=`which arm-none-eabi-gcc`
if [ "${GCC:=-}" == "-" ]; then
    sudo apt-get install arm-none-eabi-gcc
    GCC=`which arm-none-eabi-gcc`
fi

QBS=`which qbs`
if [ "${QBS:=-}" == "-" ]; then
    sudo apt-get install qbs
    QBS=`which qbs`
fi

$QBS setup-toolchains $GCC arm
qbs config profiles.arm.qbs.architecture arm

echo "DONE"
