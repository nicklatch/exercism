pub fn today(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [today, ..] -> today
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [] -> [1]
    [today, ..days] -> [today + 1, ..days]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  case days {
    [] -> False
    [0, ..] -> True
    [_, ..rest] -> has_day_without_birds(rest)
  }
}

pub fn total(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [curr, ..rest] -> curr + total(rest)
  }
}

pub fn busy_days(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [curr, ..rest] if curr > 4 -> busy_days(rest) + 1
    [_, ..rest] -> busy_days(rest)
  }
}
