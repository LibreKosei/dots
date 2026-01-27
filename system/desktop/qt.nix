{config, pkgs, lib, ...}:
let 
    cfg = config.global.desktop.qt;
in 
{
    options.global.desktop.qt = {
        enable = lib.mkEnableOption "Qt and qt5ct for theme";
        extraPackages = lib.mkOption {
            type = lib.types.listOf lib.types.package;
            default = with pkgs; [
                qt6.qtmultimedia
                qt6.qtquickeffectmaker
                qt6.qtdeclarative
                kdePackages.qtdeclarative
                kdePackages.qqc2-desktop-style
            ];
            description = "Qt packages to install";
        };
    };

    config = lib.mkIf cfg.enable {
        qt.enable = true;
        qt.platformTheme = "qt5ct";
        environment.systemPackages = cfg.extraPackages;
    };
}
