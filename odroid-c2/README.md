# Displays

This folder contains vfd.conf files for the Odroid-C2 boards. Each file name consists of the board(s) it is intended for, the controller name and the display configuration.  
[How to connect the display](#odroid-c2)

## LCDs

HD44780 LCD displays are very basic alphanumeric displays.  
The most commonly available displays are 20x4 and 16x2, meaning they are 20 or 16 characters wide and have 4 or 2 lines of text.  
There are other configurations available, such as 20x2 or 16x4, but they are less common.  
There are 40x4 displays available as well, but those have 2 HD44780 controllers, and are NOT supported.  
You have to make sure that the display you choose has an I2C (also called IIC sometimes) "backpack module", it will allow to convert the 16 pins on the LCD to the 4 pins on your board.

**odroid-c2-hd44780-1602-vfd.conf:**  
odroid-c2 - Intended for Odroid-C2.  
hd44780 - HD44780 controller, alphanumeric LCDs.  
1602 - the display is 16 characters wide and has 2 lines or 16x2.

**odroid-c2-hd44780-2004-vfd.conf:**  
odroid-c2 - Intended for Odroid-C2.  
hd44780 - HD44780 controller, alphanumeric LCDs.  
2004 - the display is 20 characters wide and has 4 lines or 20x4.

## OLEDs

OLED displays are more tricky. There are many different displays available, based on different controllers.  
OpenVFD primarily supports SSD1306 based OLED displays and other controllers with compatible command sets.  
Usually, but not always, the controller used depends on display size. Make sure that you know what controller is on the display before you place an order.  
SSD1306 OLEDs usually come in three configurations:

1. 0.96" and 128x64 resolution.
1. 0.91" and 128x32 resolution.
1. 0.66" and 64x48 resolution.

SSD1309 OLEDs should be 100% compatible with OpenVFD. They are relatively expensive and come in larger sizes, such as 2.42" and 128x64 resolution.

SH1106 OLEDs are a little different. They are almost fully compatible, and therefore OpenVFD can drive this controller as well, but it requires different configuration parameters.  
These OLEDs usually come in two sizes:

1. 1.3" and 128x64 resolution.
1. 0.96" and 128x64 resolution.

They  are most common in 1.3" sizes, though.

**odroid-c2-sh1106-12864-vfd.conf:**  
odroid-c2 - Intended for Odroid-C2.  
sh1106 - SH1106 controller, graphic monochrome OLEDs.  
12864 - Resolution, 128 pixels wide, 64 pixels high. 128x64.

**odroid-c2-ssd1306-12864-vfd.conf:**  
odroid-c2 - Intended for Odroid-C2.  
ssd1306 - SSD1306 controller, graphic monochrome OLEDs.  
12864 - Resolution, 128 pixels wide, 64 pixels high. 128x64.

**odroid-c2-ssd1306-12832-vfd.conf:**  
odroid-c2 - Intended for Odroid-C2.  
ssd1306 - SSD1306 controller, graphic monochrome OLEDs.  
12832 - Resolution, 128 pixels wide, 32 pixels high. 128x32.

## Odroid-C2

```text
Display  Board
VCC      5V                   - Pin #2
GND      GND                  - Pin #6
SCL      GPIODV_27 - I2CB_SCL - Pin #28
SDA      GPIODV_26 - I2CB_SDA - Pin #27
```

![Odroid-C2 pinout](https://wiki.odroid.com/_media/odroid-c2/hardware/c2_j2.png)

### [Odroid-C2 Expansion Connectors](https://wiki.odroid.com/odroid-c2/hardware/expansion_connectors/)
