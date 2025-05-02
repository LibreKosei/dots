{config, pkgs, ...}:
    let
        symlink = config.lib.file.mkOutOfStoreSymlink;
        home = config.home.homeDirectory;
    in
{
    home.packages = with pkgs; [
        hyprland
        hypridle
        hyprlock
        hyprshot
    ];

    xdg.configFile.hypr = {
        recursive = true;
        source = symlink "${home}/.dotfiles/home/programs/hypr/conf";
    };
}
