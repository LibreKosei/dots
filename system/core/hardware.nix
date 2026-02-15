{lib, config, pkgs, options, ...}:
let 
    cfg = config.global.core.power;
in
{
    options.global.core.power = {
        enable = lib.mkEnableOption "Power management";

        acpid.enable = lib.mkEnableOption "ACPI daemon";

        tlp.enable = lib.mkEnableOption "TLP power optimization";
    };

    config = lib.mkIf cfg.enable (lib.mkMerge [
        # ACPi 
        (lib.mkIf cfg.acpid.enable {
            services.acpid.enable = true;
            
            services.thermald.enable = true;
            powerManagement.powertop.enable = true;

            services.logind = {
                lidSwitch = "suspend";
                lidSwitchDocked = "suspend";
            };
        })

        # TLP 
        (lib.mkIf cfg.tlp.enable {
            services.tlp.enable = true;
        })
    ]);
}
