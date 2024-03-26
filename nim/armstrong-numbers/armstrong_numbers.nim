import math, sequtils

proc isArmstrongNumber*(n: int): bool =
  case n
  of 0..9: return true
  of 10..99: return false
  else:
    let n_str = $n
    n == sum n_str.mapIt((it.int - 48) ^ len(n_str))