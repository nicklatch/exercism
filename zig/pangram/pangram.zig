const std = @import("std");

/// Returns a bool according to whether or not `str` uses all 26 letters
pub fn isPangram(str: []const u8) bool {
    if (str.len < 26) return false;

    var chars = std.bit_set.IntegerBitSet(26).initEmpty();
    for (str) |char| {
        if (!std.ascii.isAlphabetic(char)) continue;
        chars.set(std.ascii.toLower(char) - 'a');
    }

    return chars.count() == 26;
}
