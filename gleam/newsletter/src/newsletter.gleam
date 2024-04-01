import gleam/string
import gleam/list
import gleam/result
import simplifile

pub fn read_emails(path: String) -> Result(List(String), Nil) {
  case simplifile.read(path) {
    Ok(val) ->
      val
      |> string.trim
      |> string.split("\n")
      |> Ok
    Error(_) -> Error(Nil)
  }
}

pub fn create_log_file(path: String) -> Result(Nil, Nil) {
  case simplifile.write(path, "") {
    Ok(_) -> Ok(Nil)
    Error(_) -> Error(Nil)
  }
}

pub fn log_sent_email(path: String, email: String) -> Result(Nil, Nil) {
  case simplifile.append(path, email <> "\n") {
    Ok(_) -> Ok(Nil)
    Error(_) -> Error(Nil)
  }
}

pub fn send_newsletter(
  emails_path: String,
  log_path: String,
  send_email: fn(String) -> Result(Nil, Nil),
) -> Result(Nil, Nil) {
  use _ <- result.try(create_log_file(log_path))
  use email_addrs <- result.try(read_emails(emails_path))
  use email <- list.try_each(email_addrs)
  
  case send_email(email) {
    Ok(_) -> log_sent_email(log_path, email)
    Error(_) -> Ok(Nil)
  }
}
