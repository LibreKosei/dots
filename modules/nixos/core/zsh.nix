{ config, lib, ...}:
let 
    cfg = config.modules.core.zsh;
in 
{
    options.modules.core.zsh = {
        enable = lib.mkEnableOption "ZSH and eza as ls";
    };
    
    config = lib.mkIf cfg.enable {
        programs.zsh = {
            enable = true;
            autosuggestions.enable = true;
            syntaxHighlighting.enable = true;
            enableCompletion = true;
            histSize = 10000;
            shellAliases = {
                ls = "eza -1 --icons";
            };
        };
    };
}
