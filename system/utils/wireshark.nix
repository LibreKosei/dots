{config, pkgs, lib, ...}:
let 
    cfg = config.global.utils.wireshark;
in 
{
    options.global.utils.wireshark = {
        enable = lib.mkEnableOption "Wireshark";
    };

    config = lib.mkIf cfg.enable {
        programs.wireshark = {
            enable = true;
        };

        environment.systemPackages = with pkgs; [
            wireshark
        ];
    };
}
