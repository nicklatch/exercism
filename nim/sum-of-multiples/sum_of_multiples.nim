import sequtils

proc sum*(limit: int, factors: openArray[int]): int =
  case len(factors)
  of 0: return 0
  else:
    for number in 1..<limit:
      if factors.anyIt(it != 0 and number mod it == 0): result.inc(number)




      
