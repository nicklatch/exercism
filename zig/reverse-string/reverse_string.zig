const std = @import("std");

/// Writes a reversed copy of `s` to `buffer`.
pub fn reverse(buffer: []u8, s: []const u8) []u8 {
    if (s.len == 0 or s.len == 1) return @constCast(s);

    var stream = std.io.fixedBufferStream(buffer);
    var idx: usize = s.len - 1;

    while (idx > 0) : (idx -= 1) {
        stream.writer().writeByte(s[idx]) catch unreachable;
    }

    return stream.getWritten();
}
