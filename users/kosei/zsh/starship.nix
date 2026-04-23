{ config, lib, ...}:
let 
    symlink = config.lib.file.mkOutOfStoreSymlink;
    home = config.home.homeDirectory;
in 
{
    programs.starship = {
        enable = true;
        enableZshIntegration = true;
    };
    
    xdg.configFile."starship.toml" = {
        recursive = false;
        source = symlink "${home}/.dotfiles/users/kosei/zsh/starship.toml";
    };
}
