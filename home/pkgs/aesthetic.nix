{ pkgs, ...}:
{
    home.packages = with pkgs; [
        matugen
        gowall
        swww
        waypaper
    ];
}
