import gleam/iterator.{type Iterator}

pub type StockError {
  NoStock
}

pub type Item {
  Item(name: String, price: Int, quantity: Int)
}

pub fn item_names(items: Iterator(Item)) -> Iterator(String) {
  iterator.map(items, fn(item) { item.name })
}

pub fn cheap(items: Iterator(Item)) -> Iterator(Item) {
  iterator.filter(items, fn(item) { item.price < 30 })
}

pub fn out_of_stock(items: Iterator(Item)) -> Iterator(Item) {
  iterator.filter(items, fn(item) { item.quantity == 0 })
}

pub fn total_stock(items: Iterator(Item)) -> Int {
  iterator.map(items, fn(item) { item.quantity })
  |> iterator.fold(0, fn(total, qty) { total + qty })
}
