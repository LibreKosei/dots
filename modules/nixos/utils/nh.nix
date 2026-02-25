{ config, lib, ...}:
let 
    cfg = config.modules.utils.nh;
in
{
    options.modules.utils.nh = {
        enable = lib.mkEnableOption "nh CLI";
    };

    config = lib.mkIf cfg.enable {
        programs.nh = {
            enable = true;
            clean.enable = true;
            clean.extraArgs = "--keep-since 4d --keep 3";
            flake = "/home/kosei/.dotfiles";
        };
    };
}
