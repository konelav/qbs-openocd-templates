#!/bin/sh

echo '
ATTR{idProduct}=="0101", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="0102", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="0103", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="0104", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="0105", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="0107", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="0108", ATTR{idVendor}=="1366", MODE="666"
' > /etc/udev/rules.d/99-jlink.rules

# TODO: st-link rules

systemctl restart udev
