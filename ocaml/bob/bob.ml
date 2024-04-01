let rec has_qmark lst =
  match lst with
  | [] -> false
  | h :: t -> (
      match h with
      | '?' -> true
      | '\t' | '\n' | '\r' | ' ' -> has_qmark t
      | _ -> false)

let is_uppercase s =
  String.equal (String.uppercase_ascii s) s
  && String.exists (fun x -> match x with 'A' .. 'Z' -> true | _ -> false) s

let tran x = match x with '\t' | '\n' | '\r' | ' ' -> ' ' | _ -> 'a'

let whitespace x =
  String.equal (String.map tran x) (String.make (String.length x) ' ')

let response_for s =
  let question =
    has_qmark @@ List.rev @@ List.init (String.length s) (fun i -> s.[i])
  in
  let upper = is_uppercase s in
  let ws = whitespace s in
  match (question, upper, ws) with
  | true, true, _ -> "Calm down, I know what I'm doing!"
  | true, false, _ -> "Sure."
  | false, true, false -> "Whoa, chill out!"
  | _, _, true -> "Fine. Be that way!"
  | _, _, _ -> "Whatever."
