import gleam/set.{type Set}
import gleam/list
import gleam/string
import gleam/result

pub fn new_collection(card: String) -> Set(String) {
  set.from_list([card])
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  #(set.contains(collection, card), set.insert(collection, card))
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  let trade_is_possible =
    set.contains(collection, my_card) && !set.contains(collection, their_card)
  let updated = set.delete(collection, my_card)
  #(trade_is_possible, set.insert(updated, their_card))
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  list.reduce(collections, set.intersection)
  |> result.unwrap(set.new())
  |> set.to_list
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  collections
  |> list.map(fn(collection) { set.to_list(collection) })
  |> list.flatten
  |> set.from_list
  |> set.size
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  collection
  |> set.filter(fn(card) { string.contains(string.lowercase(card), "shiny") })
}
