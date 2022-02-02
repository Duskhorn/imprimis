const std = @import("std");

const files = &[_][]const u8 {
    "game/ai.cpp",   
    "game/client.cpp",   
    "game/cserver.cpp",   
    "game/edit.cpp",   
    "game/entities.cpp",   
    "game/game.cpp",   
    "game/gameclient.cpp",    
    "game/minimap.cpp",   
    "game/render.cpp",   
    "game/scoreboard.cpp",   
    "game/server.cpp",   
    "game/serverbrowser.cpp",   
    "game/waypoint.cpp",   
    "game/waypointai.cpp",   
    "game/weapon.cpp",
    "game/main.cpp",  
};

const flags = &[_][]const u8 {
//    "-O3",
//    "-ffast-math",
    "-std=c++17",
//    "-march=x86-64",
    "-Wall",
    "-fsigned-char",
    "-D_GLIBCXX_USE_CXX11_ABI=0"
};

pub fn build(b: *std.build.Builder) void {
    const mode = b.standardReleaseOptions();
    const imprimis = b.addExecutable("native_client", null);
    imprimis.addCSourceFiles(files, flags);

    imprimis.addIncludeDir("game");
    imprimis.addIncludeDir("libprmis-headers");
    imprimis.addIncludeDir("enet/include");
    imprimis.addIncludeDir("/usr/X11R6/include");
    imprimis.addIncludeDir("/usr/include/SDL2");

    imprimis.linkLibC();
    imprimis.linkLibCpp();
    imprimis.linkSystemLibrary("primis");
    imprimis.linkSystemLibrary("enet");
    imprimis.linkSystemLibrary("z");
    imprimis.linkSystemLibrary("GL");
    imprimis.linkSystemLibrary("SDL2");
    imprimis.linkSystemLibrary("SDL2_image");
    imprimis.linkSystemLibrary("SDL2_mixer");
    imprimis.linkSystemLibrary("X11");

    imprimis.setBuildMode(mode);
    imprimis.install();
}