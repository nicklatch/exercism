pub fn keep(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  case list {
    [] -> []
    [head, ..tail] -> {
      case predicate(head) {
        True -> [head, ..keep(tail, predicate)]
        False -> keep(tail, predicate)
      }
    }
  }
}

pub fn discard(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  case list {
    [] -> []
    [head, ..tail] ->
      case predicate(head) {
        True -> discard(tail, predicate)
        False -> [head, ..discard(tail, predicate)]
      }
  }
}
