import gleam/string
import gleam/list

pub fn to_rna(dna: String) -> Result(String, Nil) {
  case
    dna
    |> string.to_graphemes
    |> list.try_map(fn(ch) { dna_decode(ch) })
  {
    Ok(val) -> Ok(string.join(val, ""))
    Error(_) -> Error(Nil)
  }
}

fn dna_decode(nucleotide: String) -> Result(String, Nil) {
  case nucleotide {
    "G" -> Ok("C")
    "C" -> Ok("G")
    "T" -> Ok("A")
    "A" -> Ok("U")
    _ -> Error(Nil)
  }
}
