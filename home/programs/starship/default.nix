{config, pkgs, ...}:
let
    symlink = config.lib.file.mkOutOfStoreSymlink;
    homeDir = config.home.homeDirectory;
in
{
    programs.starship = {
        enable = true;
    };

    xdg.configFile."starship.toml".source = symlink "${homeDir}/.dotfiles/home/programs/starship/starship.toml";

    home.packages = with pkgs; [
        starship
    ];
}
