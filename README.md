# Linux OpenVFD Configurations

This repository contains driver configuration files for the [Linux OpenVFD](https://github.com/arthur-liberman/linux_openvfd) driver for FD628 ([datasheet](http://pdf1.alldatasheet.com/datasheet-pdf/view/232882/PTC/PT6964.html)) and similar LED display controllers. The FD628 is often used in Android TV boxes with a 7-segment display. Although the FD628 has support for a multitude of configurations the current implementation supports only common cathode and common anode displays with 7 segments. The driver also supports the FD650 which uses a variation of the same I2C protocol, and HD44780 text-based LCD displays using an I2C backpack.

Where possible configuration files are named to match Linux kernel device-tree names, e.g.

`meson-gxl-s905w-tanix-tx3-mini.conf` pairs with `meson-gxl-s905w-tanix-tx3-mini.dts`

Please read separate instructions to use displays connected to [Khadas VIM2](meson-gxm-khadas-vim2-README.md), [LePotato](meson-gxl-s905x-libretech-cc-README.md) and [Odroid C2](meson-gxbb-odroid-c2-README.md).

The configuration file consists of several entries:

## vfd_gpio_clk / vfd_gpio_dat / vfd_gpio_stb

These tell the driver which GPIO pins are connected to the controller pins. Each entry must have 3 values:

1. Index of the GPIO bank. Amlogic SoCs usually have 2x banks where index `0` refers to `banks` and `1` to `ao-bank`.
1. Pin number in the GPIO bank as an integer or hex value. If you have pin names but not the numeric values you'll need to look them up. Here are links to pin names/numbers for the [S912, S905X, S905D, S905W](https://github.com/openSUSE/kernel/blob/master/include/dt-bindings/gpio/meson-gxl-gpio.h) and [S905](https://github.com/openSUSE/kernel/blob/master/include/dt-bindings/gpio/meson-gxbb-gpio.h).
1. Reserved, should be `0`.

e.g. the configuration used with the A95X R2 box:

`vfd_gpio_clk='0,14,0'`<br>
`vfd_gpio_dat='0,15,0'`<br>
`vfd_gpio_stb='1,9,0'`

## vfd_chars

Displays can have different layouts and can be connected in different ways to the controller. This entry allows you to configure the driver so clock digits appear in the correct order, and icons (if the display has them) are displayed. The indexes start from 0 (0 indexed).  

The internal layout of the driver is as follows:

1. Dots/Icons that display device state such as WiFi/Ethernet status or whether a USB drive is connected, etc.
1. Hours x10
1. Hours
1. Minutes x10
1. Minutes

e.g. the configuration used with the A95X R2 box:

`vfd_chars='4,0,1,2,3'`

## vfd_dot_bits

This allows you to set the order in which Dots/Icons are displayed by the driver. In most cases (so far) this entry will use the default 0-6 order. It only needs changing if the wrong icon is displayed for a specific status. This entry is 0 indexed.

e.g. the configuration used in the A95X R2 box:

`vfd_dot_bits='0,1,2,3,4,5,6'`

## vfd_display_type

This defines which type of display your device has, its electrical layout (common cathode or anode), and the controller type. It is important to set this correctly else you may see scrambled, inverted, or incomplete digits or missing icons. The values are all 0 indexed.

1. Display type:
   * A display like the Sunvell T95U.
   * A display like the Sunvell T95m (similar to T95U but icons are positioned differently and digits are inverted).
   * A display like the X92 Android TV Box. This display has a common anode electrical layout.
   * A display like the A95X R2 and Abox A1 Max.
   * A display like the T95K or Tap 1 which does not have icons.
1. Reserved: must be `0`.
1. Flags:
   * Bit 0 - When set to `1` the driver will address the display as a common anode unit. If this bit is set incorrectly the display will usually show garbage.
   * Bit 1-5 - Reserved, should be `0`.
   * Bit 6 - When set to `1` the driver uses a slower frequency to communicate with the display controller.
   * Bit 7 - Reserved, should be `0`.
1. Controller:
   * FD628 and compatible controllers.
   * FD620.
   * TM1618.

e.g. some known configurations:

`vfd_display_type='0x03,0x00,0x00,0x00'` - A95X R2<br>
`vfd_display_type='0x02,0x00,0x01,0x00'` - X92<br>
`vfd_display_type='0x04,0x00,0x00,0x01'` - T95K
