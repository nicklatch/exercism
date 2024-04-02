pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && a == b && b == c
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && { a == b || a == c || b == c }
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && a != b && a != c && b != c
}

fn is_triangle(a: Float, b: Float, c: Float) -> Bool {
  case a, b, c {
    0.0, _, _ -> False
    _, 0.0, _ -> False
    _, _, 0.0 -> False
    _, _, _ -> a +. b >=. c && b +. c >=. a && a +. c >=. b
  }
}
