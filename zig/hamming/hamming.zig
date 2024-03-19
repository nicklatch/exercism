pub const DnaError = error{ EmptyDnaStrands, UnequalDnaStrands };

pub fn compute(first: []const u8, second: []const u8) DnaError!usize {
    if (first.len == 0 or second.len == 0) {
        return DnaError.EmptyDnaStrands;
    } else if (second.len != first.len) {
        return DnaError.UnequalDnaStrands;
    }

    var result: usize = 0;

    for (0.., first) |idx, char| {
        if (char != second[idx]) {
            result += 1;
        }
    }

    return result;
}
