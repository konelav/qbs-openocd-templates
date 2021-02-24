Templates for Qbs + OpenOCD + arm-none-eabi-gcc toolchain
=========================================================

Supported chip families:
  - stm32f10x;
  - stm32f4xx;
  - mdr32f9qx;
  - mdr1986ve1t.


Usage with QtCreator
====================

1. Configure QtCreator by enabling BareMetal plugin,
  adding ARM device and arm-none-eabi-gcc compiler with OpenOCD
  debugger.

2. Open `template-*/*.qbs` (e.g. `template-stm32f10x/stm32f10x.qbs`)
  project file with QtCreator.

3. Connect target MCU with st-link or j-link debugger. Edit
  `openocd.cfg` in project directory so `use_jlink` is set to one
  when using j-link and to zero when using st-link.

4. Run `openocd` (`openocd.bat` for Windows) from project file
  directory. If everything is OK, you will see messages about
  connection to ARM device.

5. Start debugging from QtCreator. You will be able to place
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
