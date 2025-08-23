{config, pkgs, ...}:
{
    home.packages = with pkgs; [
        hyprland
        hypridle
        hyprlock
        hyprshot
        hyprland-qtutils
        hyprland-qt-support
    ];

    programs.waybar.enable = true;
}
