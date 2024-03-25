import sequtils

proc distance*(a, b: string): int =
  ## returns the number of differences between the two strands, `a` and `b`
  if a.len != b.len: raise newException(ValueError, "Unequal lengths")
  zip(a, b).countIt(it[0] != it[1])