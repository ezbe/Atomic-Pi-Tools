. /usr/lib/gpio-present.sh

check_gpio_bus_configuration () {
    ERRORS=0
    shift;
    if ! gpio_present "$1"; then
        echo "SCK GPIO ($1) not detected" >&2
        ERRORS="$(($ERRORS+1))"
    fi
    shift;
    if [ "$1" != "0" ] && ! gpio_present "$1"; then
        echo "MOSI GPIO ($1) not detected" >&2
        ERRORS="$(($ERRORS+1))"
    fi
    shift;
    if [ "$1" != "0" ] && ! gpio_present "$1"; then
        echo "MISO GPIO ($1) not detected" >&2
        ERRORS="$(($ERRORS+1))"
    fi
    shift;
    if [ "$#" -lt 2 ]; then
        echo "At least mode and maximum frequency must be present" >&2
        ERRORS="$(($ERRORS+1))"
    else
        if [ "$#" -ge 3 ]; then
            CS_INDEX=1
            while [ "$#" -ge 3 ]; do
                shift;
                shift;
                if [ "$1" != "0" ] && ! gpio_present "$1"; then
                    echo "#CS ($1) not detected" >&2
                    ERRORS="$(($ERRORS+1))"
                fi
                CS_INDEX="$(($CS_INDEX+1))"
                shift;
            done
            if [ "$#" -ne 0 ]; then
                echo "Leftover arguments ($#)" >&2
                ERRORS="$(($ERRORS+1))"
            fi
        fi
    fi
    return "$ERRORS"
}
