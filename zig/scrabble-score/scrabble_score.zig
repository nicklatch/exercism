const std = @import("std");

pub fn score(s: []const u8) u32 {
    if (s.len == 0) {
        return 0;
    }

    var score_total: u32 = 0;
    for (s) |char| {
        switch (std.ascii.toUpper(char)) {
            'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' => score_total += 1,
            'D', 'G' => score_total += 2,
            'B', 'C', 'M', 'P' => score_total += 3,
            'F', 'H', 'V', 'W', 'Y' => score_total += 4,
            'K' => score_total += 5,
            'J', 'X' => score_total += 8,
            'Q', 'Z' => score_total += 10,
            else => {},
        }
    }

    return score_total;
}
