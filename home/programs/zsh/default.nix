{config, pkgs, ...}:
{
    home.packages = with pkgs; [
        zsh-powerlevel10k
    ];
}
