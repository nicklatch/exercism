import strutils, re

proc isLoudNoise(s: string): bool =
  s.contains(re"[A-Z]") and not s.contains(re"[a-z]")

proc hasQMark(s: string): bool =
  s.endsWith(re"\?\s*")

proc hey*(s: string): string =
  if s.isEmptyOrWhitespace():
    return "Fine. Be that way!"
  elif isLoudNoise(s):
    if hasQMark(s):
      return "Calm down, I know what I'm doing!"
    else:
      "Whoa, chill out!"
  elif hasQMark(s):
    return "Sure."
  else:
    return "Whatever."
      
    

    
