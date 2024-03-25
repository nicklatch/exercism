import math, sequtils

proc squareOfSum*(n: int): int = toSeq(1..n).sum ^ 2

proc sumOfSquares*(n: int): int = toSeq(1..n).mapIt( it ^ 2).sum

proc difference*(n: int): int = squareOfSum(n) - sumOfSquares(n)
