pub fn reply(message: &str) -> &str {
    match message.trim() {
        msg if msg.is_empty() => "Fine. Be that way!",
        msg if loud_noises(msg) && msg.ends_with("?") => "Calm down, I know what I'm doing!",
        msg if loud_noises(msg) => "Whoa, chill out!",
        msg if msg.ends_with("?") => "Sure.",
        _ => "Whatever."
    }
}

pub fn loud_noises(message: &str) -> bool {
    message.contains(char::is_alphabetic) && !message.contains(char::is_lowercase)
}
