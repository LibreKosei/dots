{pkgs, options, lib, config, ...}:
let 
    cfg = config.modules.desktop.hyprland;
in
{
    options.modules.desktop.hyprland = {
        enable = lib.mkEnableOption "Hyprland";
        hyprlock.enable = lib.mkEnableOption "Hyprlock";
        hypridle.enable = lib.mkEnableOption "Hypridle";
    };

    config = lib.mkIf cfg.enable {
        programs.hyprland.enable = true;
        xdg.portal = {
            enable = true;
            extraPortals = [
                pkgs.xdg-desktop-portal-gtk
                pkgs.xdg-desktop-portal-hyprland
            ];  
        };
        environment.sessionVariables = {
            WLR_NO_HARDWARE_CURSORS = "1";
            NIXOS_OZONE_WL = "1";
            QT_QPA_PLATFORM = "wayland";
        };
        hardware = {
            graphics.enable = true;
        };
        programs.hyprlock.enable = lib.mkIf cfg.hyprlock.enable true;
        services.hypridle.enable = lib.mkIf cfg.hypridle.enable true;
    };
}
