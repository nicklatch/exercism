pub const NucleotideError = error{Invalid};

pub const Counts = struct {
    a: u32 = 0,
    c: u32 = 0,
    g: u32 = 0,
    t: u32 = 0,

    fn init() Counts {
        return Counts{};
    }
};

pub fn countNucleotides(s: []const u8) NucleotideError!Counts {
    var res = Counts.init();
    for (s) |val| {
        try switch (val) {
            'A' => res.a += 1,
            'C' => res.c += 1,
            'G' => res.g += 1,
            'T' => res.t += 1,
            else => NucleotideError.Invalid,
        };
    }
    return res;
}
