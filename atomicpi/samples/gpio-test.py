import atomicpi
import gpio as GPIO
# Control by signal ID
GPIO_0=atomicpi.signals.ISH_GPIO_0.global_idx
GPIO.setup(GPIO_0, GPIO.OUT)
GPIO.output(GPIO_0, True)
# Control with signal ID lookup on Enchilada connector first
GREEN_LED=atomicpi.signals[atomicpi.connectors.enchilada.leds.green].global_idx
GPIO.setup(GREEN_LED, GPIO.OUT)
GPIO.output(GREEN_LED, False)

GPIO.cleanup(GPIO_0)
GPIO.cleanup(GREEN_LED)
