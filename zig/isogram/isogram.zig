const std = @import("std");

/// Accepts a str and returns a bool. True if the word is an isogram, false if not
pub fn isIsogram(str: []const u8) bool {
    var chars = std.bit_set.IntegerBitSet(26).initEmpty();

    for (str) |char| {
        if (!std.ascii.isAlphabetic(char)) continue;

        const char_idx = std.ascii.toLower(char) - 'a';
        if (chars.isSet(char_idx)) return false;

        chars.set(char_idx);
    }

    return true;
}
