import gleam/float.{square_root}

pub fn score(x: Float, y: Float) -> Int {
  case square_root({ { x *. x } +. { y *. y } }) {
    Ok(sqrt) -> points(sqrt)
    Error(_) -> 0
  }
}

fn points(landing: Float) -> Int {
  case landing {
    val if val <=. 1.0 -> 10
    val if val <=. 5.0 -> 5
    val if val <=. 10.0 -> 1
    _ -> 0
  }
}
