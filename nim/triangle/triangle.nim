import sets, math

proc inequalityCheck(sides: array[3, int]): bool =
  if sides.sum == 0:
    return false
  else:
    sides[0] + sides[1] >= sides[2] and
    sides[1] + sides[2] >= sides[0] and
    sides[0] + sides[2] >= sides[1]

proc isEquilateral*(sides: array[3, int]): bool =
  sides.inequalityCheck and sides.toHashSet.len == 1

proc isIsosceles*(sides: array[3, int]): bool =
  sides.inequalityCheck and sides.toHashSet.len <= 2

proc isScalene*(sides: array[3, int]): bool =
  sides.inequalityCheck and sides.toHashSet.len == 3
