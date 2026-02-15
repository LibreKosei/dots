{inputs, lib, config, pkgs, ...}:
let 
    cfg = config.module.desktop.discord;
in 
{
    imports = [ inputs.nixcord.homeModules.nixcord ];
    options.module.desktop.discord = {
        enable = lib.mkEnableOption "Nixcord integration (vesktop)";
    };

    config = lib.mkIf cfg.enable {
        programs.nixcord = {
            enable = true;
            vesktop.enable = true;
        };
    };
}
