pub fn convert(number: Int) -> String {
  case number {
    _ if number < 1 || number > 3999 ->
      "Arabic number must be between 1 and 3999"
    _ -> convert_inner(number)
  }
}

fn convert_inner(number: Int) -> String {
  case number {
    _ if number >= 1000 -> "M" <> convert_inner(number - 1000)
    _ if number >= 900 -> "CM" <> convert_inner(number - 900)
    _ if number >= 500 -> "D" <> convert_inner(number - 500)
    _ if number >= 400 -> "CD" <> convert_inner(number - 400)
    _ if number >= 100 -> "C" <> convert_inner(number - 100)
    _ if number >= 90 -> "XC" <> convert_inner(number - 90)
    _ if number >= 50 -> "L" <> convert_inner(number - 50)
    _ if number >= 40 -> "XL" <> convert_inner(number - 40)
    _ if number >= 10 -> "X" <> convert_inner(number - 10)
    _ if number >= 9 -> "IX" <> convert_inner(number - 9)
    _ if number >= 5 -> "V" <> convert_inner(number - 5)
    _ if number >= 4 -> "IV" <> convert_inner(number - 4)
    _ if number >= 1 -> "I" <> convert_inner(number - 1)
    _ -> ""
  }
}
