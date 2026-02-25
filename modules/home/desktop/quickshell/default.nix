{ lib, config, pkgs, inputs, ... }:
let 
    cfg = config.modules.desktop.quickshell;
in
{
    options.modules.desktop.quickshell = {
        enable = lib.mkEnableOption "Quickshell with Kirigami Framework.";

        package = lib.mkOption {
            type = lib.types.package;
            default = inputs.quickshell.package.${pkgs.hostPlatform.system}.default.withModules [
                pkgs.kdePackages.kirigami
                pkgs.kdePackages.qtmultimedia
                pkgs.kdePackages.qt5compat
            ];
            description = "Quickshell package to use.";
        };
    };

    config = lib.mkIf cfg.enable {
        home.packages = [
            cfg.package
        ];
    };
}
