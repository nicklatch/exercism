import sequtils, algorithm, strutils

proc detectAnagrams*(word: string, candidates: openArray[string]): seq[string] =
  candidates.toSeq.filterIt(
    it.toLower != word.toLower and it.toLower.sorted == word.toLower.sorted
  )
