import gleam/list
import gleam/int
import gleam/result
import gleam/io

pub fn square_of_sum(n: Int) -> Int {
  let sum = list.range(1, n) |> list.reduce(fn(acc, x) {acc + x})

  let sum_result = result.unwrap(sum, 0)

  io.debug(sum_result)
  sum_result
}

pub fn sum_of_squares(n: Int) -> Int {
  3
}

pub fn difference(n: Int) -> Int {
  3
}
