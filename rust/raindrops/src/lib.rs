use std::iter::FilterMap;
pub fn raindrops(n: u32) -> String {
    let drops = [
        if n % 3 == 0 { Some("Pling") } else {None},
        if n % 5 == 0 { Some("Plang") } else {None},
        if n % 7 == 0 { Some("Plong") } else {None},
    ];

    let none_count = drops
        .iter()
        .filter(|&sound| sound.is_none())
        .count();

    match none_count {
        3 => n.to_string(),
        _ => FilterMap::collect(drops.iter().filter_map(|&sound| sound))
    }
}
