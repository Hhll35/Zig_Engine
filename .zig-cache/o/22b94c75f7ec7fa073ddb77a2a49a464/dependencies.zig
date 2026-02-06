pub const packages = struct {
    pub const @"zglfw-0.1.0-BghZXaTUAAAkCOlD_2akK4k1zIzo6HIXelVZu39yr_MO" = struct {
        pub const build_root = "C:\\Users\\Eli\\AppData\\Local\\zig\\p\\zglfw-0.1.0-BghZXaTUAAAkCOlD_2akK4k1zIzo6HIXelVZu39yr_MO";
        pub const build_zig = @import("zglfw-0.1.0-BghZXaTUAAAkCOlD_2akK4k1zIzo6HIXelVZu39yr_MO");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
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
    .{ "zglfw", "zglfw-0.1.0-BghZXaTUAAAkCOlD_2akK4k1zIzo6HIXelVZu39yr_MO" },
    .{ "zigglgen", "zigglgen-0.5.0-zigglr_CLwBs1aABtYVtxNPo1SB8AzgKMVouoqULqkDQ" },
};
