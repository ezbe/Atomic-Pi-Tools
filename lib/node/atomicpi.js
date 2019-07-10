Object.assign(module.exports,{
    /* Kernel-visible signals */
    "signals": {
        /* External GPIO */
        "ISH_GPIO_0":   {"chip": "gpiochip3", "chip_idx": 21, "global_idx": 335},
        "ISH_GPIO_1":   {"chip": "gpiochip3", "chip_idx": 18, "global_idx": 332},
        "ISH_GPIO_2":   {"chip": "gpiochip3", "chip_idx": 24, "global_idx": 338},
        "ISH_GPIO_3":   {"chip": "gpiochip3", "chip_idx": 15, "global_idx": 329},
        "ISH_GPIO_4":   {"chip": "gpiochip3", "chip_idx": 22, "global_idx": 336},
        "ISH_GPIO_7":   {"chip": "gpiochip3", "chip_idx": 16, "global_idx": 330},
        /* Volume up pin */
        "GPIO_DFX_2":   {"chip": "gpiochip1", "chip_idx":  7, "global_idx": 348},
        /* Volume down pin */
        "GPIO_DFX_4":   {"chip": "gpiochip1", "chip_idx":  5, "global_idx": 346},
        /* Internal signals */
        "I2C2_3P3_SDA": {"chip": "gpiochip0", "chip_idx": 62, "global_idx": 476},
        "I2C2_3P3_SCL": {"chip": "gpiochip0", "chip_idx": 66, "global_idx": 480},
        "AU_MIC_SEL": {"chip": "gpiochip1", "chip_idx":  0, "global_idx": 341},
        "XMOS_RESET":   {"chip": "gpiochip1", "chip_idx":  8, "global_idx": 349},
        "BN_INT":       {"chip": "gpiochip1", "chip_idx": 17, "global_idx": 358},
        "BN_RESET":     {"chip": "gpiochip1", "chip_idx": 25, "global_idx": 366}
    },
    /* Physical connector descriptions */
    "connectors": {
        /* 26-pin connector interface */
        "atomicpi": {
            "index_of": {
                "ISH_GPIO_0": 24,
                "ISH_GPIO_1": 25,
                "ISH_GPIO_2": 26,
                "ISH_GPIO_3": 18,
                "ISH_GPIO_4": 19,
                "ISH_GPIO_7": 20
            }
        },
        /* Enchilada breakout board */
        "enchilada": {
            "index_of": {
                "ISH_GPIO_0": 9,
                "ISH_GPIO_1": 10,
                "ISH_GPIO_2": 11,
                "ISH_GPIO_3": 3,
                "ISH_GPIO_4": 4,
                "ISH_GPIO_7": 5
            },
            "leds": {
                "green":  "ISH_GPIO_1",
                "yellow": "ISH_GPIO_2"
            }
        }
    }
})
