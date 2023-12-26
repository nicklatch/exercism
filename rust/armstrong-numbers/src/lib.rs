pub fn is_armstrong_number(num: u32) -> bool {
    let parsed_num = split_num_to_digit_vec(num);

    let mut split_sum: u32 = 0;

    for num in parsed_num.1 {
        match split_sum.checked_add(num.pow(parsed_num.0)) {
            Some(sum) => split_sum = sum,
            None => break
        }
    }

    split_sum == num
}

pub fn split_num_to_digit_vec(num: u32) -> (u32, Vec<u32>) {
    let num_string = num.to_string();

    let split_and_parse: Vec<u32> = num_string
        .chars()
        .map(|d| d.to_digit(10).unwrap())
        .collect();

    (num_string.len() as u32, split_and_parse)
}
