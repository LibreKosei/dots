{ config, pkgs, ...}:
let
    mcServerName = "minecraft-server-fabricLatest"; 
in 
{
    programs.zsh = {
        enable = true;
        syntaxHighlighting.enable = true;
        enableCompletion = true;
        autosuggestion = {
            enable = true;
            strategy = [
                "history"
                "completion"
            ];
        };
        zplug = {
            enable = true;
            plugins = [
                { name = "zsh-users/zsh-autosuggestions"; }
            ];
        };
        shellAliases = {
            ".." = "cd ..";
            ls = "eza -1 --icons";
            mcStat = "sudo systemctl status ${mcServerName}";
            mcRestart = "sudo systemctl restart ${mcServerName}";
        };
        autocd = true;
    };
}
