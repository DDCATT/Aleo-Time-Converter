// The 'time_converter' program.
program time_converter.aleo {
    struct Time {
        days: u64,
        hours: u64,
        minutes: u64,
        seconds: u64
    }

    transition main(value: u64, fromUnit: u64, toUnit: u64) -> Time {
        assert(fromUnit >= 0u64 && fromUnit <= 3u64);

        // fromUnit: 0 = seconds, 1 = minutes, 2 = hours, 3 = days
        // toUnit: 0 = seconds, 1 = minutes, 2 = hours, 3 = days

        if (toUnit < fromUnit) {
            if (fromUnit == 3u64) {
                return Time {
                    days: 0u64,
                    hours: value * 24u64,
                    minutes: 0u64,
                    seconds: 0u64
                };
            } else if (fromUnit == 2u64) {
                if (toUnit == 1u64) {
                    return Time {
                        days: 0u64,
                        hours: 0u64,
                        minutes: value * 60u64,
                        seconds: 0u64
                    };
                } else {
                    return Time {
                        days: 0u64,
                        hours: 0u64,
                        minutes: 0u64,
                        seconds: value * 3600u64
                    };
                }
            } else if (fromUnit == 1u64) {
                return Time {
                    days: 0u64,
                    hours: 0u64,
                    minutes: 0u64,
                    seconds: value * 60u64
                };
            } else {
                return Time {
                    days: 0u64,
                    hours: 0u64,
                    minutes: 0u64,
                    seconds: value
                };
            }
        } else if (toUnit > fromUnit) {
            if (toUnit == 3u64) {
                if (fromUnit == 2u64) {
                    return Time {
                        days: value / 24u64,
                        hours: value % 24u64,
                        minutes: 0u64,
                        seconds: 0u64
                    };
                } else if (fromUnit == 1u64) {
                    return Time {
                        days: value / 1440u64,
                        hours: (value % 1440u64) / 60u64,
                        minutes: value % 60u64,
                        seconds: 0u64
                    };
                } else {
                    return Time {
                        days: value / 86400u64,
                        hours: (value % 86400u64) / 3600u64,
                        minutes: (value % 3600u64) / 60u64,
                        seconds: value % 60u64
                    };
                } 
            } else if (toUnit == 2u64) {
                if (fromUnit == 1u64) {
                    return Time {
                        days: 0u64,
                        hours: value / 60u64,
                        minutes: value % 60u64,
                        seconds: 0u64
                    };
                } else {
                    return Time {
                        days: 0u64,
                        hours: value / 3600u64,
                        minutes: value % 3600u64 / 60u64,
                        seconds: value % 3600u64 % 60u64
                    };
                }
            } else {
                return Time {
                    days: 0u64,
                    hours: 0u64,
                    minutes: 0u64,
                    seconds: value
                };
            }
        } else {
            if (fromUnit == 0u64) {
                return Time {
                    days: 0u64,
                    hours: 0u64,
                    minutes: value / 60u64,
                    seconds: value % 60u64
                };
            }
        }

        return Time {
            days: 0u64,
            hours: 0u64,
            minutes: 0u64,
            seconds: 0u64
        };
    }
}
