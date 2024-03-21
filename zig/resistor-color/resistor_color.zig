const std = @import("std");

pub const ColorBand = enum {
    black,
    brown,
    red,
    orange,
    yellow,
    green,
    blue,
    violet,
    grey,
    white,
};

/// Returns the resistance value (ordinal from its enum) based on the given `color`.
pub fn colorCode(color: ColorBand) usize {
    return @intFromEnum(color);
}

/// Returns the set of all colors in `ColorBand`
pub fn colors() []const ColorBand {
    return std.enums.values(ColorBand);
}
