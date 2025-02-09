//! This module provides the struct representing the processor used in this emulator.
const std = @import("std");
const op = @import("./op_codes/currently_implemented.zig");

//// A structure that represents the W65C02S 8-bit microprocessor.
pub const W65C02S = packed struct {

    var buffer: [100]u8 = undefined;
    var fba: *std.heap.ThreadSafeAllocator;
    const Self = @This();

    pub fn reset (allocator: *std.mem.Allocator, self: Self) CPU {
        .allocator = allocator;

        self.registers = {
            program_counter.current_value = 0;
            processor_status.reset;
            stack_pointer.current_value = 0;
        };

        return 0;
    }

    pub const registers = struct {

        //// The 16-bit Program Counter Register (PC) provides the addresses which are used to step the microprocessor through sequential program instructions.
        //// This register is incremented each time an instruction or operand is fetched from program memory
        pub const program_counter = struct {
            // The value of the program counter is modified automatically as instructions are executed.
            size: u16,
            current_value: u16,
        };

        pub const processor_status = packed struct(u8) {
            const Self = @This();

            carry: bool = false,
            zero: bool = false,
            interrupt: bool = false,
            decimal: bool = false,
            break_: bool = false,
            _: bool = false,
            overflow: bool = false,
            negative: bool = false,
        };

        pub const stack_pointer = struct {
            // The processor supports a 256 byte stack located between $0100 and $01FF.
            size: u8,
            current_value: u8,

            const STACK_LOW = 0x0100;
            const STACK_HIGH = 0x01FF;
        };

        pub const accumulator = struct {
            size: u8,
            current_value: u8,
        };

        pub const index_register_x = struct {
            size: u8,
            current_value: u8,
        };

        pub const index_register_y = struct {
            size: u8,
            current_value: u8,
        };
    };

    fn change_processor_status (flag: u8, status: bool, self: Self) Self {
        W65C02.processor_status.flag = status;
    }
};
