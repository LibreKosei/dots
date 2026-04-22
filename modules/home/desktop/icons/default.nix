{ config, options, lib, pkgs, ...}:
let
  cfg = config.modules.desktop.icons;
in 
{
    options.modules.desktop.icons = {
        enable = lib.mkEnableOption "Various icon themes";
        extraPackages = lib.mkOption {
            description = "extra icon theme to install";
            type = lib.types.listOf lib.types.package;
            default = with pkgs; [
                (callPackage ./neuwaita.nix {})
            ];
        };
    };

    config = lib.mkIf cfg.enable {
        home.packages = with pkgs; [
            vimix-icon-theme
            qogir-icon-theme
            dracula-icon-theme
            candy-icons
            whitesur-icon-theme
            morewaita-icon-theme
            gnome-icon-theme
            kdePackages.breeze-icons
            hicolor-icon-theme
            adwaita-icon-theme
            adwaita-icon-theme-legacy
            fluent-icon-theme
            kora-icon-theme
        ] ++ cfg.extraPackages;
    };
}
