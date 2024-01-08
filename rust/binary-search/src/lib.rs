pub fn find(array: &[i32], key: i32) -> Option<usize> {
    let mut sorted = array.to_vec();
    sorted.sort();

    let mut left = 0;
    let mut right = sorted.len();

    while left < right {
        let mid = left + (right - left) / 2;
        match sorted[mid].cmp(&key) {
            std::cmp::Ordering::Less => left = mid + 1,
            std::cmp::Ordering::Greater => right = mid,
            std::cmp::Ordering::Equal => return Some(mid),
        }
    }

    None
}
