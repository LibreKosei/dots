{ config, lib, ...}:
let 
    cfg = config.global.utils.nh;
in
{
    options.global.utils.nh = {
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
