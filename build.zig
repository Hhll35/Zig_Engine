const std = @import("std");

// Mutates the build graph; an external runner executes it.
pub fn build(b: *std.Build) void {
    // Target + optimization come from `zig build` flags
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    //const glfw_dep = b.dependency("glfw_zig", .{ .target = target, .optimize = optimize });
    //const glad_dep = b.dependency("zig_glad", .{ .target = target, .optimize = optimize });

    // Public engine module (importable by consumers)
    const mod = b.addModule("Zig_Engine", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
    });

    //mod.linkLibrary(library: *Compile);

    // Main executable
    const exe = b.addExecutable(.{
        .name = "Zig_Engine",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = "Zig_Engine", .module = mod },
            },
        }),
    });

    // Generate OpenGL bindings
    const gl_bindings = @import("zigglgen").generateBindingsModule(b, .{
        .api = .gl,
        .version = .@"4.1",
        .profile = .core,
        .extensions = &.{ .ARB_clip_control, .NV_scissor_exclusive },
    });
    exe.root_module.addImport("gl", gl_bindings);

    // GLFW dependency
    const zglfw = b.dependency("zglfw", .{});
    exe.root_module.addImport("zglfw", zglfw.module("root"));

    if (target.result.os.tag != .emscripten) {
        exe.linkLibrary(zglfw.artifact("glfw"));
    }

    // Install artifact to zig-out/
    b.installArtifact(exe);

    // `zig build run`
    const run_step = b.step("run", "Run the app");
    const run_cmd = b.addRunArtifact(exe);
    run_step.dependOn(&run_cmd.step);
    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    // Module tests
    const mod_tests = b.addTest(.{ .root_module = mod });
    const run_mod_tests = b.addRunArtifact(mod_tests);

    // Executable tests
    const exe_tests = b.addTest(.{ .root_module = exe.root_module });
    const run_exe_tests = b.addRunArtifact(exe_tests);

    // `zig build test`
    const test_step = b.step("test", "Run tests");
    test_step.dependOn(&run_mod_tests.step);
    test_step.dependOn(&run_exe_tests.step);
}
