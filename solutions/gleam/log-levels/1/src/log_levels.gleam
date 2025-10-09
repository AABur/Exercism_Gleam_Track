import gleam/string

pub fn message(log_line: String) -> String {
  let parts = string.split(log_line, on: ": ")
  case parts {
    [_, log_message] -> string.trim(log_message)
    _ -> ""
  }
}

pub fn log_level(log_line: String) -> String {
  let parts = string.split(log_line, on: ": ")
  case parts {
    [log_level_part, _] ->
      log_level_part
      |> string.replace("[", "")
      |> string.replace("]", "")
      |> string.lowercase
    _ -> ""
  }
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
