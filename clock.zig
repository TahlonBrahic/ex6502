const std = @import("std");

const Self = @This();
const NANOSECONDS_PER_SECOND = 1_000_000_000;

timer: std.time.Timer

pub const Clock = struct {
    allocator: *std.mem.Allocator,

    pub fn init (allocator: *std.mem.Allocator) Clock {
        .allocator = allocator
    };

    pub fn start {};

    pub fn stop {};

    pub fn step {};

    pub fn isRunning {};
} 
