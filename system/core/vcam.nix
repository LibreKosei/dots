{ config, lib, pkgs, options, ...}:
let 
    cfg = config.global.core.vcam; 
in
{
    options.global.core.vcam = {
        enable = lib.mkEnableOption "Virtucal camera for OBS";
    };

    config = lib.mkIf cfg.enable {
        boot.extraModulePackages = with config.boot.kernelPackages; [
            v4l2loopback
        ];

        boot.kernelModules = [ "v4l2loopback" ];
        boot.extraModprobeConfig = ''
            options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
        '';   
    };
}
