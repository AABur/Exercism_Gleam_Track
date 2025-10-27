// import gleam/list

// pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
//   let numbers = case limit > 1 {
//     True -> list.range(1, limit - 1)
//     False -> []
//   }

//   let usable_factors =
//     factors
//     |> list.filter(fn(factor) { factor != 0 })

//   numbers
//   |> list.filter(fn(number) {
//     list.any(usable_factors, fn(factor) { number % factor == 0 })
//   })
//   |> list.fold(from: 0, with: fn(acc, number) { acc + number })
// }

import gleam/int
import gleam/list

pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  list.range(1, limit - 1)
  |> list.filter(fn(n) { list.any(factors, fn(f) { f > 0 && n % f == 0 }) })
  |> int.sum
}
