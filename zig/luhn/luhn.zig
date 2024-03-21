const std = @import("std");

pub fn isValid(s: []const u8) bool {
    switch (s.len) { // avoid un-needed allocations with early return
        1 => return false,
        2 => if (s[0] == ' ' or s[1] == ' ') return false,
        else => {},
    }

    var checksum: u32 = 0;
    var double_if_odd: u32 = 0;
    var val: u32 = undefined; // declared outside of loop to avoid allocation on each iteration
    var current: u8 = undefined; // declared outside of loop to avoid allocation on each iteration
    var idx: usize = s.len - 1;

    while (idx >= 0) : (idx -= 1) { // chose to go with a while loop here to avoid having to reverse the input.
        if (s[idx] == ' ') continue;

        current = s[idx];
        switch (current >= '0' and current <= '9') {
            true => {
                val = current - '0';
                if (double_if_odd & 1 == 1) val <<= 1; // using a mask to check even/odd
                if (val > 9) val -= 9;
                checksum += val;
                double_if_odd += 1;
                if (idx == 0) break; // prevents overflow on final iteration
            },
            else => return false,
        }
    }
    return checksum % 10 == 0;
}
