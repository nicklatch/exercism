open Base
module Int_map = Map.M (Int)

type school = string list Int_map.t

let empty_school = Map.empty (module Int)

let add name grade = Map.add_multi ~key:grade ~data:name

let grade = Fn.flip Map.find_multi

let sorted = Map.map ~f:(List.sort ~compare:String.compare)

let roster school = sorted school |> Map.data |> List.concat
