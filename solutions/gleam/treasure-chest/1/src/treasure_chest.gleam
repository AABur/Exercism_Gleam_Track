pub type TreasureChest(treasure) {
  TreasureChest(password: String, treasure: treasure)
}

pub type UnlockResult(treasure) {
  Unlocked(treasure)
  WrongPassword
}

pub fn get_treasure(
  chest: TreasureChest(treasure),
  password: String,
) -> UnlockResult(treasure) {
  case chest {
    _ if chest.password == password -> Unlocked(chest.treasure)
    _ -> WrongPassword
  }
}
