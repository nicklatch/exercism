import gleam/list
import gleam/int

pub fn square_of_sum(n: Int) -> Int {
  list.range(1, n)
  |> int.sum
  |> fn(x: Int) -> Int { x * x }
}

pub fn sum_of_squares(n: Int) -> Int {
  list.range(1, n)
  |> list.fold(0, fn(acc: Int, n: Int) -> Int { acc + { n * n } })
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
