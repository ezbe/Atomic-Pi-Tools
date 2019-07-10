var atomicpi = require("atomicpi");
var GPIO = require("sysfs-gpio");
// Control by signal ID
GPIO.export(atomicpi.signals.ISH_GPIO_0.global_idx, (pin) => {
   pin.out();
   pin.high();
});
// Control with signal ID lookup on Enchilada connector first
GPIO.export(atomicpi.signals[atomicpi.connectors.enchilada.leds.green].global_idx, (pin) => {
   pin.out();
   pin.low();
});
process.stdin.resume();
