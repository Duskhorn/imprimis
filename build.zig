const std = @import("std");

const files = &[_][]const u8 {
    "game/ai.c",   
    "game/client.c",   
    "game/cserver.c",   
    "game/edit.c",   
    "game/entities.c",   
    "game/game.c",   
    "game/gameclient.c",   
    "game/main.c",   
    "game/minimap.c",   
    "game/render.c",   
    "game/scoreboard.c",   
    "game/server.c",   
    "game/serverbrowser.c",   
    "game/waypoint.c",   
    "game/waypointai.c",   
    "game/weapon.c"
};

const flags = &[_][]const u8 {
    "-O3",
    "-ffast-math",
    "-std=c++17",
    "-march=x86-64",
    "-Wall",
    "-fsigned-char"
};

pub fn build(b: *std.build.Builder) void {
    const mode = b.standardReleaseOptions();
    const imprimis = b.addExecutable("native_client", null);
    imprimis.addCSourceFiles(files, flags);

    imprimis.addIncludeDir("game");
    imprimis.addIncludeDir("enet/include");
    imprimis.addIncludeDir("/usr/X11R6/include");
    imprimis.addIncludeDir("/usr/include/SDL2");

    imprimis.linkLibC();
    imprimis.linkLibCpp();
    imprimis.linkSystemLibrary("z");
    imprimis.linkSystemLibrary("GL");
    imprimis.linkSystemLibrary("SDL2_image");
    imprimis.linkSystemLibrary("X11");
    imprimis.linkSystemLibrary("primis");
    imprimis.linkLibrary("enet");
    imprimis.linkSystemLibrary("enet");

    imprimis.setBuildMode(mode);
    imprimis.install();
}