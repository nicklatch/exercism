pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  tl_rec_pizza_price(pizza, 0)
}

fn tl_rec_pizza_price(pizza: Pizza, price_acc: Int) -> Int {
  case pizza {
    Margherita -> 7 + price_acc
    Caprese -> 9 + price_acc
    Formaggio -> 10 + price_acc
    ExtraSauce(pizza) -> tl_rec_pizza_price(pizza, price_acc + 1)
    ExtraToppings(pizza) -> tl_rec_pizza_price(pizza, price_acc + 2)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  case order {
    [_] -> tl_rec_order_price(order, 3)
    [_, _] -> tl_rec_order_price(order, 2)
    _ -> tl_rec_order_price(order, 0)
  }
}

fn tl_rec_order_price(order: List(Pizza), price_acc: Int) -> Int {
  case order {
    [] -> price_acc
    [item, ..items] -> tl_rec_order_price(items, price_acc + pizza_price(item))
  }
}
