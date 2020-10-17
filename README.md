# vfd.config

This repository contains configuration files for devices that have a 7 segment display (most often they're Android TV Boxes), driven by FD628 or a similar controller.  
This configuration file is device specific, as each device has different GPIO pins connected to the display controller. The displays themselves vary as well, there are displays with different visual and electrical layouts, which require different configuration options to be set.  
It alleviates the need for multiple device specific DTBs (Device Tree Binaries), and is much easier to modify and deploy on the device.  
**The configuration file should be formatted as an Environment File.**
***
The configuration file consits of several entries:

## GPIO

* vfd_gpio_clk
* vfd_gpio_dat
* vfd_gpio_stb

These entries are responsible for telling the driver which GPIO pins are connected to each of the controller pins. Each entry must have 3 values.

1. GPIO bank. Amlogic SoCs usually have 2 GPIO banks, this value represents the index of the GPIO bank. In case of Amlogic index 0 refers to 'banks' and index 1 to 'ao-bank'.
1. This value represents the pin number in the GPIO bank. The value can be an integer or a hexadecimal value. If you have the pin names, but not the actual numeric values, you'll need to look them up. Here are links to the pin names/numbers for the most popular (at the time of writing) Amlogic SoCs:  [S912, S905X, S905D, S905W](https://github.com/openSUSE/kernel/blob/master/include/dt-bindings/gpio/meson-gxl-gpio.h), [S905](https://github.com/openSUSE/kernel/blob/master/include/dt-bindings/gpio/meson-gxbb-gpio.h)
1. This value is currently reserved and should always be 0.

Here's the configuration used in the A95X R2 box:

* vfd_gpio_clk='0,14,0'
* vfd_gpio_dat='0,15,0'
* vfd_gpio_stb='1,9,0'

## Character order

* vfd_chars

Displays can have different layouts, and they can be connected in different ways to the controller. This entry allows you to configure the driver in such a way that the clock digits appear in the correct order, and that the icons (if the display has them) are displayed as well. The indexes start from 0 (0 indexed).  
The internal layout of the driver is as follows:

1. Icons or Dots, these are the small icons that display different device states, such as wifi or ethernet status, whether a USB drive is connected, etc.
1. Hours x10.
1. Hours.
1. Minutes x10.
1. Minutes.

Here's the configuration used in the A95X R2 box:

* vfd_chars='4,0,1,2,3'

## Dot order

* vfd_dot_bits

This entry allows you set the order at which the Dots or Icons are displayed by the driver. In most cases (so far), this entry will be left at the default order of 0 - 6. It only needs to be changed in case the wrong icon is displayed for a specific status. This entry is 0 indexed.

Here's the configuration used in the A95X R2 box:

* vfd_dot_bits='0,1,2,3,4,5,6'

## Display type

* vfd_display_type

This entry tells the driver which type of display your device has, its electrical layout (common cathode or anode) and which controller the device is using. It is important to set this entry correctly, otherwise you may get a scrambled, upside down or even uncomplete digits and/or missing icons.  
Here are the values, they are all 0 indexed.

1. Display type - this value tells the driver about the layout and icons of the display. At this time the driver supports the following display layouts:

   ID | Display type
   -- | ----------------------------------------------
   0  | A display like on the Sunvell T95U
   1  | A display like on the Sunvell T95m. It is similar to T95U, but the icons are positioned differently, and the digits are "upside down".
   2  | A display like on the X92 S912 Android TV Box. This display usually has a common anode electrical layout.
   3  | A display like on the A95X R2 (or the Abox A1 Max).
   4  | A display like on the T95K, these displays do not have icons.
   5  | A display like on the Tap1, Tap Pro, Mini One RK3229, MXV+, or Dune HD Sky 4K Plus.
   6  | A display like on the M9 Pro, U2C X+, U5X+S, or Magicsee C400 Plus.
   7  | A display like on the G9SX/Enybox X1.
   8  | A display like on the Freesat GTC.
1. Reserved - must be 0.
1. Flags:

   Bits | Description
   ---- | --------------------------------------------
   0    | When this bit is '1', the driver will address the display as a common anode unit. When this bit is configured incorrectly, the display will usually show garbage.
   1..5 | Reserved, should be 0.
   6    | When this bit is '1', the driver will use a slower frequency to communicate with the display controller.
   7    | Reserved, should be 0.

1. Controller:

   ID | Description
   -- | --------------------------------
   0  | FD628 and compatible controllers
   1  | FD620
   2  | TM1618
   3  | FD650
   4  | 7S MAX
   5  | IL3829
   6  | PCD8544
   7  | SH1106
   8  | SSD1306
   9  | HD44780 and compatible controllers

Here are some possible configurations:

* vfd_display_type='0x03,0x00,0x00,0x00' - A95X R2.
* vfd_display_type='0x02,0x00,0x01,0x00' - X92 S912.
* vfd_display_type='0x04,0x00,0x00,0x01' - T95K.
