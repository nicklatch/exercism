const std = @import("std");

/// Writes a reversed copy of `s` to `buffer`.
pub fn reverse(buffer: []u8, s: []const u8) []u8 {
    const s_len = s.len; // store the length avoid recalculating length every time

    for (s, 0..) |char, idx| {
        buffer[s_len - 1 - idx] = char;
    }
    return buffer;
}
