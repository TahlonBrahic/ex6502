const std = @import("std");

//! This module provides the struct representing the processor used in this emulator.

//// A structure that represents the W65C02S 8-bit microprocessor.
pub const W65C02S = struct {

    var buffer: [100]u8 = undefined;
    var fba: *std.heap.ThreadSafeAllocator,

    pub fn init (allocator: *std.mem.Allocator) CPU {
        .allocator = allocator
    };

    pub const registers = struct {
      pub const program_counter = struct {
          // The value of the program counter is modified automatically as instructions are executed.
          size: u16;
          current_value u16;
          modifyProgramCounter;
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

      }

      pub const stack_pointer = struct {
          // The processor supports a 256 byte stack located between $0100 and $01FF.
          size: u8;
          current_value: u8;
          fn push ();
          fn pull;
      };

      pub const accumulator = struct {
          size: u8;
      };

      pub const index_register_x = struct {
          size: u8;
          current
      };

      pub const index_register_y = struct {
          size = 8bit;
      };
    };
}
