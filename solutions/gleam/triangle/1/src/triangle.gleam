fn is_triangle(a: Float, b: Float, c: Float) -> Bool {
  case a, b, c {
    x, y, z
      if x >. 0.0
      && y >. 0.0
      && z >. 0.0
      && x +. y >. z
      && x +. z >. y
      && y +. z >. x
    -> True
    _, _, _ -> False
  }
}

pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && a == b && b == c
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && { a == b || b == c || a == c }
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && a != b && b != c && a != c
}
