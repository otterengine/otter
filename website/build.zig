const std = @import("std");
const zine = @import("zine");

pub fn build(b: *std.Build) !void {
    zine.website(b, .{
        .title = "Otter Engine",
        .host_url = "https://otterengine.org",
        .content_dir_path = "content",
        .layouts_dir_path = "layouts",
        .assets_dir_path = "assets",
    });
}
