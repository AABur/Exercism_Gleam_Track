import gleam/list

pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  let #(column, row) = place_location
  #(row, column)
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  place_location_to_treasure_location(place_location) == treasure_location
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  let #(_, place_location) = place
  let target_location = place_location_to_treasure_location(place_location)

  treasures
  |> list.filter(fn(treasure) {
    let #(_, treasure_location) = treasure
    treasure_location == target_location
  })
  |> list.length
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  let #(found_name, _) = found_treasure
  let #(place_name, _) = place
  let #(desired_name, _) = desired_treasure

  case place_name {
    "Abandoned Lighthouse" ->
      found_name == "Brass Spyglass" && desired_name != found_name
    "Stormy Breakwater" -> {
      let desired_allowed =
        desired_name == "Crystal Crab" || desired_name == "Glass Starfish"
      found_name == "Amethyst Octopus" && desired_allowed
    }
    "Harbor Managers Office" -> {
      let desired_allowed =
        desired_name == "Model Ship in Large Bottle" ||
        desired_name == "Antique Glass Fishnet Float"
      found_name == "Vintage Pirate Hat" && desired_allowed
    }
    _ ->
      False
  }
}
