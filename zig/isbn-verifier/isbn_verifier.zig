const std = @import("std");
var gpa = std.heap.GeneralPurposeAllocator(.{}){};

/// Returns a bool dependant on if `s` is a valid ISBN
pub fn isValidIsbn10(s: []const u8) bool {
    const length = s.len;
    if (length < 10 or length > 13) return false;

    var multiplier: u8 = 10;
    var sum: u32 = 0;
    
    for (s) |c| {
        var digit: u8 = undefined;
        switch (c) {
            '-' => continue,
            '0'...'9' => digit = c - '0',
            'X' => digit = 10,
            else => return false,
        }

        if (multiplier < 1 or digit == 10 and multiplier > 1) return false;

        sum += (digit * multiplier);
        multiplier -= 1;
    }

    return multiplier == 0 and sum % 11 == 0;
}
