pub fn isValid(s: []const u8) bool {
    const s_len = s.len;
    var checksum: u32 = 0;
    var num_count: u32 = 0;

    for (s, 0..) |_, idx| {
        const val = s[s_len - 1 - idx];
        switch (val) {
            '0'...'9' => {
                const n = val - '0';
                switch (@mod(num_count, 2) != 0) {
                    true => {
                        checksum += switch (n >= 5) {
                            true => n * 2 - 9,
                            false => n * 2,
                        };
                    },
                    false => {
                        checksum += n;
                        num_count += 1;
                    },
                }
            },
            ' ' => continue,
            else => return false,
        }
    }

    return @mod(checksum, 10) == 0 and num_count > 1;
}
