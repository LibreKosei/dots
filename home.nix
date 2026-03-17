{ inputs, config, pkgs, ... }:
{
    home.username = "kosei";
    home.homeDirectory = "/home/kosei";

    imports = [ 
        ./home 
    ];
    home.stateVersion = "24.11"; # Please read the comment before changing.
    
    module = {
        desktop = {
            quickshell.enable = true;
        };
    };

    home.packages = with pkgs; [
        brightnessctl
        dart-sass
        wl-clipboard
        killall
        libnotify
        unzip
        zip
        efibootmgr
        fastfetch
        woeusb
        inputs.icon-browser.packages.${pkgs.system}.default
        devenv
        rofi
        libreoffice-fresh
        xournalpp
        libinput
        blanket
        qt6Packages.qt6ct
        bitwarden-desktop
        nautilus   
        zsh-powerlevel10k
        fzf
        htop
        jq
        signal-desktop
        usbutils
        evtest
        qbittorrent
        protonvpn-gui
        starship
    ];

    home.sessionVariables = {
        EDITOR = "nvim";
    };

    qt.enable = true;

    programs.home-manager.enable = true;
}
