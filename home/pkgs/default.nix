{config, pkgs, ...}:
{
    imports = [
        ./browsers
        ./games
        ./obsidian
        ./unfree
        ./wallpaper
    ];

    home.packages = with pkgs; [
        bitwarden
        nautilus   
    ];
}
