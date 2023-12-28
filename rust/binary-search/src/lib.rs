pub fn find(array: &[i32], key: i32) -> Option<usize> {
    if array.is_empty() {
        return None;
    }

    let mut sorted_arr = array.to_vec();
    sorted_arr.sort();

    let mut start = 0;
    let mut end = sorted_arr.len() - 1;

    while start <= end {
        let middle = start + (end - start) / 2;

        if key == sorted_arr[middle] {
            return Some(middle);
        }

        if key < sorted_arr[middle] {
            end = match middle.checked_sub(1) {
                Some(num) => num,
                None => break,
            };
        } else {
            start = match middle.checked_add(1) {
                Some(num) => num,
                None => break,
            }
        }
    }

    None
}
