{config, pkgs, lib, ...}:
let 
    cfg = config.modules.utils.wireshark;
in 
{
    options.modules.utils.wireshark = {
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
