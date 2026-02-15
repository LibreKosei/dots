{config, lib, pkgs, inputs, ...}:
let 
    cfg = config.module.desktop.quickshell;
in 
{
    options.module.desktop.quickshell = {
        enable = lib.mkEnableOption "Quickshell";
    };

    config = lib.mkIf cfg.enable {
        home.packages = [
            (inputs.quickshell.packages.${pkgs.system}.default.withModules [
                pkgs.kdePackages.kirigami
                pkgs.kdePackages.qtmultimedia
                pkgs.kdePackages.qt5compat
            ])
        ];
    };
}
