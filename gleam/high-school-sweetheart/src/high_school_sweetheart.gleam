import gleam/string
import gleam/list

pub fn first_letter(name: String) -> String {
  string.trim(name)
  |> string.slice(0, 1)
}

pub fn initial(name: String) -> String {
  first_letter(name)
  |> string.uppercase <> "."
}

pub fn initials(full_name: String) -> String {
  string.split(full_name, " ")
  |> list.map(fn(name) { initial(name) })
  |> string.join(" ")
  |> string.trim()
}

pub fn pair(full_name1: String, full_name2: String) {
  "
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     X. X.  +  Y. Y.     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"
  |> string.replace("X. X.", initials(full_name1))
  |> string.replace("Y. Y.", initials(full_name2))
}
