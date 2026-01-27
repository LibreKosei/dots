{config, pkgs, lib, ...}:
let 
    cfg = config.global.core.bluetooth;
in 
{
    options.global.core.bluetooth = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Enable bluetooth support with some packages";
        };
        defaultPackages = lib.mkOption {
            type = lib.types.listOf lib.types.package;
            default = with pkgs; [gnome-bluetooth];
            description = "Default bluetooth packages";
        };
        extraPackages = lib.mkOption {
            type = lib.types.listOf lib.types.package;
            default = [];
            description = "Extra bluetooth packages to install";
        };
    };

    config = lib.mkIf cfg.enable {
        users.users.kosei.packages = cfg.extraPackages;
        hardware.bluetooth = {
            enable = true;
            settings = {
                General = {
                    Name = "Hello";
                    ControllerMode = "dual";
                    FastConnectable = "true";
                    Experimental = "true";
                };
                Policy = {
                    AutoEnable = true;
                };
            };
        };
        services.blueman.enable = true;
        hardware.bluetooth.package = pkgs.bluez;
    };
}
