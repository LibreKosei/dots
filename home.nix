{ config, pkgs, ... }:
{
    home.username = "kosei";
    home.homeDirectory = "/home/kosei";

    imports = [ ./home ./development];
    home.stateVersion = "24.11"; # Please read the comment before changing.

    home.packages = with pkgs; [
        brightnessctl
        dart-sass
        wl-clipboard
        killall
        libnotify
        unzip
        zip
        efibootmgr
        gtk4-layer-shell
    ];

    home.sessionVariables = {
    # EDITOR = "emacs";
    };

    programs.home-manager.enable = true;
}
