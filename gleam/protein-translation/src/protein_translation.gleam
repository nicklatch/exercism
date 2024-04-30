import gleam/list
import gleam/string

pub fn proteins(rna: String) -> Result(List(String), Nil) {
  case string.length(rna) >= 3 {
    True ->
      string.to_graphemes(rna)
      |> list.sized_chunk(into: 3)
      |> list.map(fn(lst) { string.join(lst, "") })
      |> translate_condons(Ok([]))
    False -> Ok([])
  }
}

fn translate_condons(
  condons: List(String),
  acc: Result(List(String), Nil),
) -> Result(List(String), Nil) {
  case condons {
    [] -> Ok([])
    [head, tail] -> 
    case condons_to_protine(head) {
      val if val == "STOP" -> acc
      val if val != "" -> 
    }
  }
}

fn condons_to_protine(condond: String) -> String {
  case condond {
    "AUG" -> "Methionine"
    "UUU" | "UUC" -> "Phenylalanine"
    "UUA" | "UUG" -> "Leucine"
    "UCU" | "UCC" | "UCA" | "UCG" -> "Serine"
    "UAU" | "UAC" -> "Tyrosine"
    "UGU" | "UGC" -> "Cysteine"
    "UGG" -> "Tryptophan"
    "UAA" | "UAG" | "UGA" -> "STOP"
    _ -> ""
  }
}
