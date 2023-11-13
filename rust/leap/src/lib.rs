pub fn is_leap_year(year: u64) -> bool {
    if year % 4 != 0 {
        false
    } else if year % 100 == 0 {
        return year % 400 == 0
    } else {
        return year % 100 != 0
    }
}

