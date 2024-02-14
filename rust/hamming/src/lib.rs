/// Return the Hamming distance between the strings,
/// or None if the lengths are mismatched.
pub fn hamming_distance(s1: &str, s2: &str) -> Option<usize> {
    match s1.len() {
        s1_len if s1_len != s2.len() => None,
        0 => Some(0),
        _ => Some(s1.chars().zip(s2.chars()).filter(|(x, y)| *x != *y).count()),
    }
}
