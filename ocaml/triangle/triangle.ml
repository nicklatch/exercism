let is_tri a b c =
  match (a, b, c) with
  | 0, _, _ | _, 0, _ | _, _, 0 -> false
  | _, _, _ -> a + b >= c && b + c >= a && a + c >= b

let is_equilateral a b c = is_tri a b c && a = b && b = c
let is_isosceles a b c = is_tri a b c && (a = b || a = c || b = c)
let is_scalene a b c = is_tri a b c && a <> b && a <> c && b <> c
