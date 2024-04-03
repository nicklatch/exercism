import gleam/list.{all}
import gleam/string

pub fn is_pangram(sentence: String) -> Bool {
  "abcdefghijklmnopqrstuvwxyz"
  |> string.to_graphemes
  |> all(string.contains(
    sentence
      |> string.lowercase,
    _,
  ))
}
