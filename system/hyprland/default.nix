{pkgs, ...}:
{
    programs = {
        hyprland.enable = true;
        hyprlock.enable = true;
    };

    services.hypridle.enable = true;

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
}
