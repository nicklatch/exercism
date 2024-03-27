open Base

(* Count the number of times a nucleotide occurs in the string. *)
val count_nucleotidval empty : (char, 'a, Base.Char.comparator_witness) Base.Map.t

val count_nucleotide :
  'a -> int -> int -> (int * int, string) result

val count_nucleotides : 'a -> 'b
e : string -> char -> (int, char) Result.t

(* Count the nucleotides in the string. *)
val count_nucleotides : string -> (int Map.M(Char).t, char) Result.t
