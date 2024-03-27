import sequtils, unicode

proc isIsogram*(s: string): bool =
  var v = toSeq(s.toLower.runes).filter(isAlpha)
  v.len == v.deduplicate.len
    