const std = @import("std");

pub fn convert(buffer: []u8, n: u32) []const u8 {
    var stream = std.io.fixedBufferStream(buffer);

    if (@mod(n, 3) == 0) stream.writer().writeAll("Pling") catch unreachable;
    if (@mod(n, 5) == 0) stream.writer().writeAll("Plang") catch unreachable;
    if (@mod(n, 7) == 0) stream.writer().writeAll("Plong") catch unreachable;
    if (stream.pos == 0) stream.writer().print("{d}", .{n}) catch unreachable;

    return stream.getWritten();
}
