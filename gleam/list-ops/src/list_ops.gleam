pub fn append(first first: List(a), second second: List(a)) -> List(a) {
  case second {
    [] -> first
    _ -> {
      first
      |> reverse
      |> foldl(second, fn(acc, curr) { [curr, ..acc] })
    }
  }
}

pub fn concat(lists: List(List(a))) -> List(a) {
  lists
  |> foldl([], fn(acc, curr) {
    foldl(curr, acc, fn(acc, curr) { [curr, ..acc] })
  })
  |> reverse
}

pub fn filter(list: List(a), function: fn(a) -> Bool) -> List(a) {
  case list {
    [] -> []
    [hd, ..tl] -> {
      case function(hd) {
        True -> [hd, ..filter(tl, function)]
        False -> filter(tl, function)
      }
    }
  }
}

pub fn length(list: List(a)) -> Int {
  case list {
    [] -> 0
    [_, ..tl] -> length(tl) + 1
  }
}

pub fn map(list: List(a), function: fn(a) -> b) -> List(b) {
  case list {
    [] -> []
    [hd, ..tl] -> [function(hd), ..map(tl, function)]
  }
}

pub fn foldl(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  case list {
    [] -> initial
    [hd, ..tl] -> foldl(tl, function(initial, hd), function)
  }
}

pub fn foldr(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  case list {
    [] -> initial
    [hd, ..tl] -> function(foldr(tl, initial, function), hd)
  }
}

pub fn reverse(list: List(a)) -> List(a) {
  foldl(list, [], fn(acc, curr) { [curr, ..acc] })
}
