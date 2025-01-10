import std/tables

proc transform*(t: Table[int, seq[char]]): Table[char, int] =
  result = initTable[char, int]()
  for idx, letters in t:
    for letter in letters:
      var lowerLetter =
        if ord(letter) > 97:
          letter
        else:
         char(ord(letter) + 32)
      result[lowerLetter] = idx


