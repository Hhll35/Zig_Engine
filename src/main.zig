const std = @import("std");
const Io = std.Io;

const Zig_Engine = @import("Zig_Engine");

pub fn main() !void {
    // Prints to stderr, unbuffered, ignoring potential errors.
    std.debug.print("Hello {s}\n", .{"world!"});
}
