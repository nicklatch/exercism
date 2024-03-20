const std = @import("std");

/// Writes a reversed copy of `s` to `buffer`.
pub fn reverse(buffer: []u8, s: []const u8) []u8 {
    var s_len = s.len;

    // short circuit for the obvious
    if (s_len == 0 or s_len == 1) return @constCast(s);

    var stream = std.io.fixedBufferStream(buffer);
    while (s_len > 0) : (s_len -= 1) {
        stream.writer().writeByte(s[s_len - 1]) catch unreachable;
    }

    return stream.getWritten();
}
