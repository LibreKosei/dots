{pkgs, config, lib, ...}:
let 
    cfg = config.global.core.zsh;
in 
{
    options.global.core.zsh = {
        enable = lib.mkEnableOption "ZSH integration with powerlevel10k and eza as ls";
    };
    
    config = lib.mkIf cfg.enable {
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
    };
}
