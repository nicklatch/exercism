pub fn nth(n: u32) -> u32 {
    *primes(&n).get(n as usize).expect("Error")
}

pub fn primes(n: &u32) -> Vec<u32> {
    let mut primes = vec![2];
    let maximum: u32 = n << 4;

    for candidate in 3..maximum {
        let square_root = (candidate as f64).sqrt() as u32 + 1;
        let is_prime = primes
            .iter()
            .take_while(|p| p <= &&square_root)
            .all(|p| candidate % p != 0);
        if is_prime {
            primes.push(candidate);
        }
    }

    primes
}
