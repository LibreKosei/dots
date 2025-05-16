{config, pkgs, ...}:
{
    programs.zsh = {
        enable = true;
        autosuggestion.enable = true;
        autocd = true;
        syntaxHighlighting.enable = true;
        oh-my-zsh = {
            enable = true; 
            plugins = [
                "sudo"
                "zsh-interactive-cd"
            ];
        };
        initExtra = ''
           eval "$(direnv hook zsh)"
           eval "$(starship init zsh)"
        '';
    };
}
