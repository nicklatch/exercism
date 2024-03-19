const std = @import("std");
const math = std.math;

/// Accepts a u128 integer and returns a bool representing whether or
/// not the sum of each of its digits ^ its length is equal to itself
pub fn isArmstrongNumber(num: u128) bool {

    // short circuit check of guarenteed true or false vals
    if (num >= 0 and num <= 9) return true;
    if (num > 9 and num < 100) return false;

    const num_len = num_length(num);
    var arm_sum: u128 = 0;

    // each iter adds the remainder of rem % 10^num_len
    var rem: u128 = num;
    while (rem != 0) : (rem /= 10) {
        arm_sum += math.pow(u128, @mod(rem, 10), num_len);
    }

    return arm_sum == num;
}

/// Accpets a u128 integer and returns the number of digits that comprise it. |
/// i.e: 128 has a length 3, 1000 has a length of 4, 1 has a length of 1.
fn num_length(num: u128) u8 {
    var count: u8 = 0;
    var rem = num;

    // each iter divides rem by 10 and increments count by 1
    while (rem != 0) : (rem /= 10) count += 1;
    return count;
}
