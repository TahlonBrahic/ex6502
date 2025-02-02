const std = @import("std");

pub const CPU = struct {

    allocator: *std.mem.Allocator,

    pub fn init (allocator: *std.mem.Allocator) CPU {
        .allocator = allocator
    };
}
