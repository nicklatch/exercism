proc steps*(n: int, steps: int = 0): int =
  case n
  of low(int)..0: raise newException(ValueError, "Number must be 1 or greater")
  of 1: return steps
  else:
    case n mod 2
    of 0: steps(n div 2, (steps + 1))
    else: steps((3 * n + 1), (steps + 1))
