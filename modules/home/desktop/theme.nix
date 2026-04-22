{ lib, config, pkgs, ...}:
let 
    cfg = config.modules.desktop.theme;
    
    themeProfile = lib.types.submodule {
        options = {
            gtkTheme = {
                name = lib.mkOption { type = lib.types.str; };
                package = lib.mkOption { type = lib.types.package; };
            };
            iconTheme = {
                name = lib.mkOption { type = lib.types.str; };
                package = lib.mkOption { type = lib.types.package; };
            };
            cursorTheme = {
                name = lib.mkOption { type = lib.types.str; };
                package = lib.mkOption { type = lib.types.package; };
                size = lib.mkOption {
                    type = lib.types.ints.u8;
                    default = 24;
                };
            };
            extraIconPackages = lib.mkOption {
                type = lib.types.listOf lib.types.package;
                default = [];
                description = "Additional icon themes";
            };
        };
    };
in
{
    options.modules.desktop.theme = {
        profiles = lib.mkOption {
            type = lib.types.attrsOf themeProfile;
            default = {};
            description = "Define custom theme setup";
        };

        activeProfile = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = null;
            description = "The name of theme setup to be used";
        };
    };

    config = let 
        active = if cfg.activeProfile != null then cfg.profiles.${cfg.activeProfile} else null;
    in 
        lib.mkIf active {
            gtk = {
                enable = true;
                font.name = "monospace";
                theme = { inherit (active.gtkTheme) name package; };
                iconTheme = { inherit (active.iconTheme) name package; };
                cursorTheme = { inherit (active.cursorTheme) name package size; };
            };

            home.pointerCursor = {
                inherit (active.cursorTheme) name package size;
            };

            home.packages = active.extraIconPackages;
        };
}
