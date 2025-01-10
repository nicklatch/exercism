use std::collections::HashSet;

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &'a [&str]) -> HashSet<&'a str> {
    let mut answer: HashSet<&str> = HashSet::new();
    let mut sorted_word: Vec<char> = word.to_lowercase().chars().collect();
    let _ = &sorted_word.sort();

    for &possible in possible_anagrams {
        let mut sorted_possible: Vec<char> = possible.to_lowercase().chars().collect();
        let _ = &sorted_possible.sort();

        if sorted_possible == sorted_word && word.to_lowercase() != possible.to_lowercase() {
            answer.insert(possible);
        }
    }

    answer
}
