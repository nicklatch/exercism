// Please define the TreasureChest generic custom type
pub type TreasureChest(t) {
  TreasureChest(password: String, treasure: t)
}

// Please define the UnlockResult generic custom type
pub type UnlockResult(r) {
  Unlocked(r)
  WrongPassword
}

pub fn get_treasure(
  chest: TreasureChest(treasure),
  password: String,
) -> UnlockResult(treasure) {
  case chest.password == password {
    True -> Unlocked(chest.treasure)
    False -> WrongPassword
  }
}
