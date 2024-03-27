const std = @import("std");

pub fn primes(buffer: []u32, limit: u32) []u32 {
    var current: u32 = 2;
    var buffer_size: usize = 0;

    root: while (current <= limit) : (current += 1) {
        var buffer_idx: usize = 0;
        while (buffer_idx < buffer_size) : (buffer_idx += 1) {
            if (@mod(current, buffer[buffer_idx]) == 0) continue :root;
        }

        buffer[buffer_size] = current;
        buffer_size += 1;
    }
    return buffer[0..buffer_size];
}
