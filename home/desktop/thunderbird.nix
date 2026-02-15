{config, options, lib, ...}:
let 
    cfg = config.modules.desktop.thunderbird;
in 
{
    options.modules.desktop.thunderbird = {
        enable = lib.mkEnableOption "Thunderbird client";  
    };

    config = lib.mkIf cfg.enable {
        programs.thunderbird.enable = true;
    };
}
