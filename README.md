# Time Converter Program in Leo

## Description

The `time_converter` program is a Leo application designed to convert time values between different units such as seconds, minutes, hours, and days. The program takes in a time value and the units to convert from and to, then performs the necessary calculations to output the time in the desired units.

## Structure

The program mainly consists of a `Time` structure and a `transition main` function. The `Time` structure holds the time values in days, hours, minutes, and seconds as unsigned 64-bit integers.

```leo
struct Time {
    days: u64,
    hours: u64,
    minutes: u64,
    seconds: u64
}
```

## Transition Function

The `transition main` function takes in three parameters: the value to be converted (`value`), the unit of the input value (`fromUnit`), and the unit of the output value (`toUnit`).

```leo
transition main(value: u64, fromUnit: u64, toUnit: u64) -> Time
```

- `value`: The time value to be converted.
- `fromUnit`: An integer representing the unit of the input value where 0 = seconds, 1 = minutes, 2 = hours, 3 = days.
- `toUnit`: An integer representing the unit of the output value where 0 = seconds, 1 = minutes, 2 = hours, 3 = days.

## Conversion Logic

The conversion logic is handled by a series of conditional statements that:
- Check the validity of the `fromUnit`.
- Determine whether to upscale or downscale the time value based on the `fromUnit` and `toUnit`.
- Perform the necessary calculations to convert the time value to the desired unit.

## Usage

To use the `time_converter` program, you need to provide:
- A time value.
- The unit of the provided time value.
- The unit you want to convert the time value to.

The program will then output the converted time value in the structure format, displaying the days, hours, minutes, and seconds.

## Example

To convert 2 hours into seconds:

```bash
leo run main 2u64 2u64 0u64
```

The output will be a `Time` structure with the converted time value.

## License

This project is licensed under the MIT License.

## Contributing

For any enhancements, bug fixes, or other contributions, please submit a pull request.
