{lib, config, pkgs, options, ...}:
let 
    cfg = config.modules.core.power;
in
{
    options.modules.core.power = {
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

            services.logind.settings.Login = {
                HandleLidSwitchDocked = "suspend";
                HandleLidSwitch = "suspend";
            };
        })

        # TLP 
        (lib.mkIf cfg.tlp.enable {
            services.tlp.enable = true;
        })
    ]);
}
