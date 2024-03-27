import gleam/option.{type Option, None, Some}

pub fn two_fer(name: Option(String)) -> String {
  case name {
    Some(val) -> "One for " <>val<> ", one for me."
    None -> "One for you, one for me."
  }
}
