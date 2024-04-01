(** Space-age exercise *)

type planet =
  | Mercury
  | Venus
  | Earth
  | Mars
  | Jupiter
  | Saturn
  | Neptune
  | Uranus

val age_on : planet -> int -> float
(** Convert seconds to years on the specified planet *)
