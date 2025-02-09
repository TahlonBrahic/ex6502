const std = @import("std");
const config = @import("config.zig");

var gpa = std.heap.GeneralPurposeAllocator(.{}){};

pub fn main !void {
    var arena = std.heap.ArenaAllocator.init(gpa.allocator());
    defer arena.deinit();
    const allocator = arena.allocator();

    W65C02S.reset();
    W65C02S.run();
}
