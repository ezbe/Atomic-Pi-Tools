from Adafruit_BNO055.BNO055 import BNO055
from time import sleep

# BNO055 is configured on I2C bus 50 in /etc/i2c-gpio-custom.d/bno055-bus by default
sensor = BNO055(busnum=50)
assert(sensor.begin())

while True:
    print('Euler=%0.2f:%0.2f:%0.2f Quaternion=%0.2f:%0.2f:%0.2f:%0.2f Temp=%0.2fC Mag=%0.2f:%0.2f:%0.2f Gyr=%0.2f:%0.2f:%0.2f Accel=%0.2f:%0.2f:%0.2f LAccel=%0.2f:%0.2f:%0.2f Gravity=%0.2f:%0.2f:%0.2f'%(
        sensor.read_euler() +
        sensor.read_quaternion() +
        (sensor.read_temp(),) +
        sensor.read_magnetometer() +
        sensor.read_gyroscope() +
        sensor.read_accelerometer() +
        sensor.read_linear_acceleration() +
        sensor.read_gravity()
    ))
    sleep(1)
