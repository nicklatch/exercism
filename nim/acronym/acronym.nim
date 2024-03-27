import strutils

proc abbreviate*(s: string): string =
  for c in s.tokenize({' ', '-', '_'}):
    if not c.isSep: result = result & $c.token[0].toUpperAscii
