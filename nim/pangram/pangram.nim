import strutils, sequtils

proc isPangram*(s: string): bool = LowercaseLetters.allIt(it in s.toLower)