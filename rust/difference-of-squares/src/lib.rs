pub fn square_of_sum(n: u32) -> u32 {
    let sum: u32 = (1..(n + 1)).sum();

    sum * sum
}

pub fn sum_of_squares(n: u32) -> u32 {
    match (1..(n + 1)).reduce(|acc, next| acc + (next * next)) {
        Some(sum) => sum,
        None => 0,
    }
}

pub fn difference(n: u32) -> u32 {
    square_of_sum(n) - sum_of_squares(n)
}
