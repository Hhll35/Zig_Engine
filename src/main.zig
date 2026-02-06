const glfw = @import("zglfw");
const gl = @import("gl");
const zm = @import("zm");
const std = @import("std");

// constants and structs
var procs: gl.ProcTable = undefined;
const WindowSize = struct {
    pub const width: u32 = 640;
    pub const height: u32 = 480;
};

pub fn main() !void {
    // glfw initialization process:
    glfw.init() catch {
        std.log.err("GLFW initialization failed", .{});
        return;
    };

    glfw.windowHint(glfw.WindowHint.context_version_major, 3);
    glfw.windowHint(glfw.WindowHint.context_version_minor, 3);
    glfw.windowHint(glfw.WindowHint.opengl_profile, glfw.OpenGLProfile.opengl_core_profile);

    defer glfw.terminate();

    // create window with glfw
    const window = glfw.Window.create(WindowSize.width, WindowSize.height, "Zig Engine", null, null) catch {
        std.log.err("GLFW Window creation failed", .{});
        return;
    };

    defer window.destroy();

    glfw.makeContextCurrent(window);
    defer glfw.makeContextCurrent(null);

    // Initialize the procedure table.
    if (!procs.init(glfw.getProcAddress)) return error.InitFailed;

    // Make the procedure table current on the calling thread.
    gl.makeProcTableCurrent(&procs);
    defer gl.makeProcTableCurrent(null);

    // here is the main event loop to stay the window alive
    while (!glfw.windowShouldClose(window)) {
        const alpha: gl.float = 1;

        gl.ClearColor(0.392, 0.584, 0.929, alpha);
        gl.Clear(gl.COLOR_BUFFER_BIT);

        glfw.swapBuffers(window);
        glfw.pollEvents();
    }
}
