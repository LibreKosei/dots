{ config, pkgs, ... }:
{
    home.username = "kosei";
    home.homeDirectory = "/home/kosei";

    imports = [ ./home ./development];
    home.stateVersion = "24.11"; # Please read the comment before changing.

    home.packages = with pkgs; [
        brightnessctl
        dart-sass
        kitty
        wl-clipboard
        yazi
        killall
        jq
        libnotify
        glib
        gtk3
        gtk4
        htop
        unzip
        zip
        efibootmgr
    ];

    home.sessionVariables = {
    # EDITOR = "emacs";
    };

    programs.home-manager.enable = true;
}
