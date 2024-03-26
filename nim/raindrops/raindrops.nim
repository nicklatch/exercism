proc convert*(n: int): string =
  if n mod 3 == 0: result &= "Pling"
  if n mod 5 == 0: result &= "Plang"
  if n mod 7 == 0: result &= "Plong"
  if result == "": result = $n
