proc binarySearch*(a: openArray[int], val: int): int =
  var left = 0
  var right = len a
  while left < right:
    var mid = left + (right - left) div 2
    if a[mid] == val: return mid
    elif a[mid] < val: left = mid + 1
    else: right = mid
  return -1





