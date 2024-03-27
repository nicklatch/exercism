proc onSquare*(n: int): uint64 =
  if n notin 1..64: raise newException(ValueError, "Must be in range of 1 to 64")
  1'u64 shl uint64(n - 1)

proc total*: uint64 = high(uint64)
