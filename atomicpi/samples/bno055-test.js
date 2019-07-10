var BNO055 = require('node-bno055');

var async = require('async');

// BNO055 is configured on I2C bus 50 in /etc/i2c-gpio-custom.d/bno055-bus by default
var imu = new BNO055({device:"/dev/i2c-50"});

imu.beginNDOF(function() {
    console.info('imu running');

    setInterval(function() {
        async.series({
            calibrationStatus: imu.getCalibrationStatus.bind(imu),
            quaternion: imu.getQuaternion.bind(imu),
            euler: imu.getEuler.bind(imu),
            linearAcceleration: imu.getLinearAcceleration.bind(imu)
        },
        function(err, results) {
            console.info( 'imu: ', JSON.stringify(results) );
        });
    }, 1000);
});
