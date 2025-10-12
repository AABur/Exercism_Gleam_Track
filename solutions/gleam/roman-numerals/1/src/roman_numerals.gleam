/// Represents a Roman numeral symbol paired with its Arabic value.
/// Gleam type names can't include underscores, so this fulfils the intent
/// of the requested `Roman_Numbers` type.
pub type RomanNumbers {
  RomanNumbers(symbol: String, value: Int)
}

const numerals: List(RomanNumbers) =
  [
    RomanNumbers("M", 1000),
    RomanNumbers("CM", 900),
    RomanNumbers("D", 500),
    RomanNumbers("CD", 400),
    RomanNumbers("C", 100),
    RomanNumbers("XC", 90),
    RomanNumbers("L", 50),
    RomanNumbers("XL", 40),
    RomanNumbers("X", 10),
    RomanNumbers("IX", 9),
    RomanNumbers("V", 5),
    RomanNumbers("IV", 4),
    RomanNumbers("I", 1),
  ]

pub fn convert(number: Int) -> String {
  case number >= 1 && number <= 3999 {
    False -> "number должен быть в интервале [1, 3999]"
    True -> convert_with_table(number, numerals)
  }
}

fn convert_with_table(number: Int, numerals: List(RomanNumbers)) -> String {
  case numerals {
    [] -> ""
    [RomanNumbers(symbol, value), ..rest] -> {
      case number >= value {
        True -> symbol <> convert_with_table(number - value, numerals)
        False -> convert_with_table(number, rest)
      }
    }
  }
}
