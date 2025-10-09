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
  Movie(Genre)
  Restaurant(Cuisine)
  Walk(Int)
  // distance in kilometers
}

pub fn rate_activity(activity: Activity) -> Approval {
  case activity {
    BoardGame -> No
    Chill -> No
    Movie(genre) ->
      case genre {
        Romance -> Yes
        _ -> No
      }
    Restaurant(cuisine) ->
      case cuisine {
        Korean -> Yes
        Turkish -> Maybe
      }
    Walk(distance) ->
      case distance {
        distance if distance > 11 -> Yes
        distance if distance > 6 -> Maybe
        _ -> No
      }
  }
}
