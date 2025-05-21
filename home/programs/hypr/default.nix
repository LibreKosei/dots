{config, pkgs, ...}:
{
    home.packages = with pkgs; [
        hyprland
        hypridle
        hyprlock
        hyprshot
    ];
}
