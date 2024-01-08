pub fn factors(n: u64) -> Vec<u64> {
    let mut vec: Vec<u64> = Vec::new();
    let mut div = n;
    let upper_bound = (n as f64).sqrt() as u64 + 1;

    for f in 2..upper_bound {
        while div % f == 0 {
            div /= f;
            vec.push(f)
        }
    }

    if div != 1 {
        vec.push(div)
    }

    vec
}
