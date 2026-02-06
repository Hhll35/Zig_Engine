pub const packages = struct {
    pub const @"system_sdk-0.3.0-dev-alwUNnYaaAJAtIdE2fg4NQfDqEKs7QCXy_qYukAOBfmF" = struct {
        pub const build_root = "C:\\Users\\Eli\\AppData\\Local\\zig\\p\\system_sdk-0.3.0-dev-alwUNnYaaAJAtIdE2fg4NQfDqEKs7QCXy_qYukAOBfmF";
        pub const build_zig = @import("system_sdk-0.3.0-dev-alwUNnYaaAJAtIdE2fg4NQfDqEKs7QCXy_qYukAOBfmF");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
        };
    };
    pub const @"zglfw-0.10.0-dev-zgVDNES4IQAAXAcsFiHfmadlpDCHhF2cUqWxBGIViyU6" = struct {
        pub const build_root = "C:\\Users\\Eli\\AppData\\Local\\zig\\p\\zglfw-0.10.0-dev-zgVDNES4IQAAXAcsFiHfmadlpDCHhF2cUqWxBGIViyU6";
        pub const build_zig = @import("zglfw-0.10.0-dev-zgVDNES4IQAAXAcsFiHfmadlpDCHhF2cUqWxBGIViyU6");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
            .{ "system_sdk", "system_sdk-0.3.0-dev-alwUNnYaaAJAtIdE2fg4NQfDqEKs7QCXy_qYukAOBfmF" },
        };
    };
    pub const @"zigglgen-0.5.0-zigglr_CLwBs1aABtYVtxNPo1SB8AzgKMVouoqULqkDQ" = struct {
        pub const build_root = "C:\\Users\\Eli\\AppData\\Local\\zig\\p\\zigglgen-0.5.0-zigglr_CLwBs1aABtYVtxNPo1SB8AzgKMVouoqULqkDQ";
        pub const build_zig = @import("zigglgen-0.5.0-zigglr_CLwBs1aABtYVtxNPo1SB8AzgKMVouoqULqkDQ");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
        };
    };
};

pub const root_deps: []const struct { []const u8, []const u8 } = &.{
    .{ "zglfw", "zglfw-0.10.0-dev-zgVDNES4IQAAXAcsFiHfmadlpDCHhF2cUqWxBGIViyU6" },
    .{ "zigglgen", "zigglgen-0.5.0-zigglr_CLwBs1aABtYVtxNPo1SB8AzgKMVouoqULqkDQ" },
};
