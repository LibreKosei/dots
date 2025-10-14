{ inputs, config, pkgs, ... }:
{
    home.username = "kosei";
    home.homeDirectory = "/home/kosei";

    imports = [ 
        ./home 
        ./development
    ];
    home.stateVersion = "24.11"; # Please read the comment before changing.

    home.packages = with pkgs; [
        brightnessctl
        material-symbols
        dart-sass
        kitty
        wl-clipboard
        killall
        libnotify
        unzip
        zip
        efibootmgr
        fastfetch
        woeusb
        inputs.icon-browser.packages.${pkgs.system}.default
        inputs.quickshell.packages.${pkgs.system}.default
        devenv
        rofi
        libreoffice-fresh
        glib
        xournalpp
        libinput
        blanket
        qt6ct
    ];

    home.sessionVariables = {
        EDITOR = "nvim";
    };

    programs.home-manager.enable = true;
}
