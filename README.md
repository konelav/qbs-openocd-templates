Templates for Qbs + OpenOCD + arm-none-eabi-gcc toolchain
=========================================================

Supported chip families:
  - stm32f10x;
  - stm32f4xx;
  - mdr32f9qx;
  - mdr1986ve1t.

Mostly tested with "Blue Pill" (stm32f103c8t6) and SWD J-Link.


Preparing device-dependent libraries
====================================

1. Download latest versions of Standard Peripheral library for
  your device.

1a. For stm chips: https://www.st.com/en/embedded-software/stm32-standard-peripheral-libraries.html

1b. For Milandr chips: https://github.com/eldarkg/emdr1986x-std-per-lib

2. Extract `CMSIS` and `*_StdPeriph_Driver` directories to proper folder in
  `libs`.

**Example**: for "Blue Pill" which has stm32f103c8t6 on board you will need
stm32f10x package (https://www.st.com/content/st_com/en/products/embedded-software/mcu-mpu-embedded-software/stm32-embedded-software/stm32-standard-peripheral-libraries/stsw-stm32054.html).
Extract `en.stsw-stm32054.zip/STM32F10x_StdPeriph_Lib_V3.5.0/Libraries/{CMSIS,STM32F10x_StdPeriph_Driver}` to `libs/stm32f10x/`.


Usage with QtCreator
====================

1. Configure QtCreator by enabling BareMetal plugin,
  adding ARM device and arm-none-eabi-gcc compiler with OpenOCD
  debugger (there are a lot of guides on the Net).

2. Open `template-*/*.qbs` (e.g. `template-stm32f10x/stm32f10x.qbs`)
  project file with QtCreator.

3. Setup project to use ARM Kit (not Desktop etc.).

4. Connect target MCU with st-link or j-link debugger. Edit
  `openocd.cfg` in project directory so `use_jlink` is set to one
  when using j-link and to zero when using st-link.

5. Run `openocd` (`openocd.bat` for Windows) from project file
  directory. If everything is OK, you will see messages about
  connection to ARM device.

6. Start debugging from QtCreator. You will be able to place
  breakpoints, add evaluated expressions etc.


Usage from shell
================

1. Connect target MCU with st-link or j-link debugger. Edit
  `openocd.cfg` in project directory so `use_jlink` is set to one
  when using j-link and to zero when using st-link.

2. Run `./rebuild && ./reflash` from project directory.


Auxiliar tools
==============

`tools/config_qbs.sh`: initialize qbs toolchain for arm-none-eabi-gcc, 
install deb packages if neccessary.

`tools/apply_patches.py`: apply patch files from `libs/patches`, needed 
for bug fix in `core_cm3.h` with `strexb`/`strexh` instructions.

`tools/make_udev_rules.sh`: create rules for j-link usb stick and restart 
udev service.

`tools/download_img.sh`: download firmware from target device, e.g. when 
you need backup before flashing untested version.

`tools/upload_img.sh`: restore previously downloaded firmware to target 
device.
