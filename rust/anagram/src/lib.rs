use std::collections::HashSet;

pub fn anagrams_for<'a>(word: &'a str, possible_anagrams: &[&str]) -> HashSet<&'a str> {
    let mut result = HashSet::new();
    let mut sword = word.clone().to_ascii_lowercase().split("");

    for pos in possible_anagrams {
        let possible = pos.to_ascii_lowercase().as_bytes();
        possible.sort();

        if possible == sword {
            result.insert(*pos);
        }
    }

    result
}
