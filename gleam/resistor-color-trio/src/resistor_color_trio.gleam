pub type Resistance {
  Resistance(unit: String, value: Int)
}

pub fn label(colors: List(String)) -> Result(Resistance, Nil) {
  case colors {
    [c1, c2, c3, ..] -> {
      let #(tens, ones, exp) = case
        color_resistance(c1),
        color_resistance(c2),
        color_resistance(c3)
      {
        t, 0, e if t > 0 -> #(0, t, e + 1)
        t, o, e -> #(t, o, e)
      }
      let base = tens * 10 + ones
      case exp {
        e if e < 3 -> Resistance("ohms", base * pow(10, e))
        e if e < 6 -> Resistance("kiloohms", base * pow(10, e - 3))
        e if e < 9 -> Resistance("megaohms", base * pow(10, e - 6))
        e if e == 9 -> Resistance("gigaohms", base * pow(10, e - 9))
        _ -> panic
      }
      |> Ok
    }
    _ -> Error(Nil)
  }
}

fn pow(b, e) {
  case e {
    0 -> 1
    e -> b * pow(b, e - 1)
  }
}

fn color_resistance(color: String) -> Int {
  case color {
    "black" -> 0
    "brown" -> 1
    "red" -> 2
    "orange" -> 3
    "yellow" -> 4
    "green" -> 5
    "blue" -> 6
    "violet" -> 7
    "grey" -> 8
    "white" -> 9
    _ -> 0
  }
}
