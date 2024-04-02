import gleam/string

pub fn hey(remark: String) -> String {
  case is_quiet(remark), is_yelling(remark), has_qmark(remark) {
    True, _, _ -> "Fine. Be that way!"
    _, True, True -> "Calm down, I know what I'm doing!"
    _, True, _ -> "Whoa, chill out!"
    _, _, True -> "Sure."
    _, _, _ -> "Whatever."
  }
}

fn is_quiet(remark: String) -> Bool {
  remark
  |> string.trim
  |> string.is_empty
}

fn is_yelling(remark: String) -> Bool {
  string.uppercase(remark) == remark && string.lowercase(remark) != remark
}

fn has_qmark(remark: String) -> Bool {
  string.ends_with(string.trim(remark), "?")
}
