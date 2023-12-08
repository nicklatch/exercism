import gleam/option.{type Option, None, Some}
import gleam/int.{compare, max}
import gleam/order.{Eq, Gt, Lt}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  case player.name {
    Some(name) -> name
    None -> "Mighty Magician"
  }
}

pub fn revive(player: Player) -> Option(Player) {
  case player.health {
    0 -> {
      case compare(player.level, 10) {
        Eq | Gt -> Some(Player(..player, health: 100, mana: Some(100)))
        Lt | _ -> Some(Player(..player, health: 100, mana: None))
      }
    }
    _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    None -> #(Player(..player, health: max(0, player.health - cost)), 0)
    Some(mana) -> {
      case compare(mana, cost) {
        Eq | Gt -> #(Player(..player, mana: Some(mana - cost)), cost * 2)
        Lt | _ -> #(player, 0)
      }
    }
  }
}
