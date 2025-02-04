{pkgs, config, ...}:
{
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    promptInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    '';
    shellAliases = {
      ls = "eza -1 --icons";
    };
  };

  programs.starship = {
      enable = true;
  };
}
