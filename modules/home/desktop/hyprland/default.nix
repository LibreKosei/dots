{pkgs, config, lib, options, ...}:
let 
    cfg = config.modules.desktop.hyprland;
    path = toString ./hypr;
in 
{
    options.modules.desktop.hyprland = {
        enable = lib.mkEnableOption "Hyprland";
    };

    config = lib.mkIf cfg.enable {
        xdg.configFile."hypr" = {
            recursive = true;
            source = path;
        };
    };
}
