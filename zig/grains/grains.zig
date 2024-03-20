const std = @import("std");
pub const ChessboardError = error{IndexOutOfBounds};

/// Returns the grain count on square `index`. If the index
/// is OOB, `ChessboardError.IndexOutOfBounds` is returned.
pub fn square(index: usize) ChessboardError!u64 {
    if (index < 1 or index > 64) return ChessboardError.IndexOutOfBounds;
    return std.math.pow(u64, 2, index - 1);
}

/// Returns the total numbers of grains on a chessboard.
pub fn total() u64 {
    return std.math.maxInt(u64);
}
