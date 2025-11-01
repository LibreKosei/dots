
{config, pkgs, ...}:
{
    qt.enable = true;
    qt.platformTheme = "qt5ct";

    environment.systemPackages = with pkgs; [
        qt6.qtmultimedia
        qt6.qt5compat
        qt6.qtquickeffectmaker
        qt6.qtdeclarative
        kdePackages.sonnet
        kdePackages.qtdeclarative
        kdePackages.qqc2-desktop-style
        pkgs.kdePackages.kirigami.passthru.unwrapped
    ];
}
