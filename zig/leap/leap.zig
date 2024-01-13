pub fn isLeapYear(year: u32) bool {
    return switch (year % 4 == 0) {
        true => year % 100 != 0 or year % 400 == 0,
        false => false
    };
}
