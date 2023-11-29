import gleam/string.{trim}

pub fn message(log_line: String) -> String {
  case log_line {
    "[INFO]:" <> message -> message
    "[ERROR]:" <> message -> message
    "[WARNING]:" <> message -> message
  }
  |> trim
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[WARNING]" <> _ -> "warning"
    "[ERROR]" <> _ -> "error"
    "[INFO]" <> _ -> "info"
  }
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
