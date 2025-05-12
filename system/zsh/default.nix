{pkgs, config, ...}:
{
    programs.zsh = {
        enable = true;
        autosuggestions.enable = true;
        shellAliases = {
            ls = "eza -1 --icons";
        };
    };

    programs.starship = {
        enable = true;
    };
}
