import gleam/list
import gleam/int.{compare, sum}
import gleam/order.{Eq, Gt, Lt}

pub type Classification {
  Perfect
  Abundant
  Deficient
}

pub type Error {
  NonPositiveInt
}

pub fn classify(number: Int) -> Result(Classification, Error) {
  case number > 0 {
    True ->
      case compare(alq_sum(number), number) {
        Lt -> Ok(Deficient)
        Eq -> Ok(Perfect)
        Gt -> Ok(Abundant)
      }
    False -> Error(NonPositiveInt)
  }
}

fn alq_sum(number: Int) -> Int {
  list.range(1, number / 2)
  |> list.filter(fn(num) { num != number && number % num == 0 })
  |> sum
}
