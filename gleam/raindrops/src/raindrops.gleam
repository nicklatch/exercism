import gleam/string.{is_empty}
import gleam/int.{to_string}

pub fn convert(number: Int) -> String {
  let sounds: String =
    sound("", number, 3, "Pling")
    |> sound(number, 5, "Plang")
    |> sound(number, 7, "Plong")

  case is_empty(sounds) {
    True -> to_string(number)
    False -> sounds
  }
}

fn sound(acc: String, number: Int, divisor: Int, rain_sound: String) -> String {
  case number % divisor == 0 {
    True -> acc <> rain_sound
    False -> acc
  }
}
