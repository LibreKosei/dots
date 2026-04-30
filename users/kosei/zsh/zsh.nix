{ config, pkgs, lib, ...}:
let
    mcServerName = "minecraft-server-fabricLatest"; 
in 
{
    programs.zsh = {
        enable = true;
        syntaxHighlighting.enable = true;
        # enableCompletion = true;
        autosuggestion = {
            enable = true;
            strategy = [
                "history"
                "completion"
            ];
        };
        defaultKeymap = "emacs";
        plugins = [
            {
                name = "fzf-tab";
                src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
            }
        ];
        shellAliases = {
            ".." = "cd ..";
            ls = "eza -1 --icons";
            mcStat = "sudo systemctl status ${mcServerName}";
            mcRestart = "sudo systemctl restart ${mcServerName}";
        };
        # initContent = let
        #     initEarly = lib.mkOrder 500 "zmodload zsh/zprof";
        #     init = lib.mkOrder 1000 "zprof";
        # in 
        #     lib.mkMerge [initEarly init];
        autocd = true;
    };
}
