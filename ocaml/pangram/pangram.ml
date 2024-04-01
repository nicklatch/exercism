open Base

let is_pangram str =
  let lower_str = String.lowercase str in
  String.for_all "qwertyuiopasdfghjklzxcvbnm" ~f:(String.contains lower_str)
