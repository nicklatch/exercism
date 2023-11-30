pub type Approval {
  Yes
  No
  Maybe
}

pub type Cuisine {
  Korean
  Turkish
}

pub type Genre {
  Crime
  Horror
  Romance
  Thriller
}

pub type Activity {
  BoardGame
  Chill
  Moive(Genre)
  Restaurant(Cuisine)
  Walk(distance: Int)
}

pub fn rate_activity(activity: Activity) -> Approval {
  case activity {
    Moive(Romance) -> Yes
    Restaurant(cuisine) -> {
      case cuisine {
        Korean -> Yes
        Turkish -> Maybe
      }
    }
    Walk(distance) -> {
      case distance {
        i if i > 11 -> Yes
        i if i > 6 -> Maybe
        _ -> No
      }
    }
    _ -> No
  }
}
