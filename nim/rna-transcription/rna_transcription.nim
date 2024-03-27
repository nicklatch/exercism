import tables

const dnaToRna = {'G':'C', 'C':'G', 'T':'A', 'A':'U'}.toTable

proc toRna*(s: string): string =
  for c in s:
    result.add(dnaToRna[c])