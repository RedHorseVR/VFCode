from ws2812 import WS2812
import utime
import machine
power = machine.Pin(11, machine.Pin.OUT)
power.value(1)
BLACK = (0, 0, 0)
RED = (255, 0, 0)
YELLOW = (255, 150, 0)
GREEN = (0, 255, 0)
CYAN = (0, 255, 255)
BLUE = (0, 0, 255)
PURPLE = (180, 0, 255)
WHITE = (255, 255, 255)
COLORS = (BLACK, RED, YELLOW, GREEN, CYAN, BLUE, PURPLE, WHITE)

led = WS2812(12, 1)


while True:
	print('Beautiful color')
	for color in COLORS:
		led.pixels_fill(color)
		led.pixels_show()
		utime.sleep(0.2)
			
	
#  Export  Date: 09:28:41 PM - 08:Sep:2024.

