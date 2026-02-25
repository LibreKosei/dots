{config, lib, ...}:
let 
    cfg = config.modules.core.jitsi;
in 
{
    options.modules.core.jitsi = {
        enable = lib.mkEnableOption "Jitsi server";

        hostname = lib.mkOption {
            type = lib.types.str;
            default = "conference.kosei.org";
            description = "hostname for this Jitsi Meet instance";
        };


    };

    config = lib.mkIf cfg.enable {
        services.jitsi-meet = {
            enable = true;
            hostName = cfg.hostname;
            prosody = {
                enable = true;
            };
        };
    };
}
