<<<<<<< HEAD
import gleam/option.{type Option}

pub fn two_fer(name: Option(String)) -> String {
  "todo"
=======
import gleam/option.{type Option, None, Some}

pub fn two_fer(name: Option(String)) -> String {
  case name {
    Some(val) -> "One for " <>val<> ", one for me."
    None -> "One for you, one for me."
  }
>>>>>>> faad5f1d8d8eb283e090191a6cfc1524ee505e0e
}
