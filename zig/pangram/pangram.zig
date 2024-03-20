const std = @import("std");


/// Used to keep track of the number of times each letter appears in a string
const AlphabetCounter = struct {
    a: u8,
    b: u8,
    c: u8,
    d: u8,
    e: u8,
    f: u8,
    g: u8,
    h: u8,
    i: u8,
    j: u8,
    k: u8,
    l: u8,
    m: u8,
    n: u8,
    o: u8,
    p: u8,
    q: u8,
    r: u8,
    s: u8,
    t: u8,
    u: u8,
    v: u8,
    w: u8,
    x: u8,
    y: u8,
    z: u8,

    pub fn init() AlphabetCounter {
        return AlphabetCounter{
            .a = 0,
            .b = 0,
            .c = 0,
            .d = 0,
            .e = 0,
            .f = 0,
            .g = 0,
            .h = 0,
            .i = 0,
            .j = 0,
            .k = 0,
            .l = 0,
            .m = 0,
            .n = 0,
            .o = 0,
            .p = 0,
            .q = 0,
            .r = 0,
            .s = 0,
            .t = 0,
            .u = 0,
            .v = 0,
            .w = 0,
            .x = 0,
            .y = 0,
            .z = 0,
        };
    }

    pub fn add(self: *AlphabetCounter, c: u8) void {
        switch (c) {
            'a' => self.a += 1,
            'b' => self.b += 1,
            'c' => self.c += 1,
            'd' => self.d += 1,
            'e' => self.e += 1,
            'f' => self.f += 1,
            'g' => self.g += 1,
            'h' => self.h += 1,
            'i' => self.i += 1,
            'j' => self.j += 1,
            'k' => self.k += 1,
            'l' => self.l += 1,
            'm' => self.m += 1,
            'n' => self.n += 1,
            'o' => self.o += 1,
            'p' => self.p += 1,
            'q' => self.q += 1,
            'r' => self.r += 1,
            's' => self.s += 1,
            't' => self.t += 1,
            'u' => self.u += 1,
            'v' => self.v += 1,
            'w' => self.w += 1,
            'x' => self.x += 1,
            'y' => self.y += 1,
            'z' => self.z += 1,
            else => {},
        }
    }

    pub fn isPangram(self: *AlphabetCounter) bool {
        return self.a > 0 and self.b > 0 and self.c > 0 and self.d > 0 and self.e > 0 and self.f > 0 and self.g > 0 and self.h > 0 and self.i > 0 and self.j > 0 and
            self.k > 0 and self.l > 0 and self.m > 0 and self.n > 0 and self.o > 0 and self.p > 0 and self.q > 0 and self.r > 0 and self.s > 0 and self.t > 0 and
            self.u > 0 and self.v > 0 and self.w > 0 and self.x > 0 and self.y > 0 and self.z > 0;
    }
};

/// Returns a bool according to whether or not `str` uses all 26 letters
pub fn isPangram(str: []const u8) bool {
    if (str.len < 26) return false;
    var counter = AlphabetCounter.init();

    for (str) |char| {
        counter.add(std.ascii.toLower(char));
    }

    return counter.isPangram();
}
