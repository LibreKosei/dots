{ inputs, config, pkgs, ... }:
{
    home.username = "kosei";
    home.homeDirectory = "/home/kosei";

    imports = [ 
        ./gtk.nix
        ./neovim
    ];

    home.stateVersion = "24.11"; # Please read the comment before changing.

    nixpkgs.config = {
        allowUnfree = true;
    };

    home.packages = with pkgs; [
        # Shell
        zsh-powerlevel10k
        starship

        # Utilities
        brightnessctl
        dart-sass
        wl-clipboard
        killall
        libnotify
        unzip
        zip
        fzf
        htop
        jq
        libinput
        pavucontrol

        # Desktop 
        nautilus   
        signal-desktop
        xournalpp
        qt6Packages.qt6ct
        inputs.icon-browser.packages.${pkgs.system}.default
        ptyxis
        rnote

        # Wallpaper utils 
        matugen
        gowall

        # Hyprland related
        hyprland
        hypridle
        hyprlock
        hyprshot
        hyprland-qtutils
        hyprland-qt-support

        # Game
        prismlauncher

        # Browsers
        firefox
        ungoogled-chromium
        brave

        # Unfree 
        obsidian

        # Rice
        (inputs.quickshell.packages.${pkgs.system}.default.withModules [
            pkgs.kdePackages.kirigami
            pkgs.kdePackages.qtmultimedia
            pkgs.kdePackages.qt5compat
        ])
    ];

    home.sessionVariables = {
        EDITOR = "nvim";
    };

    programs.home-manager.enable = true;

    # various settings
    qt.enable = true;

    programs.obs-studio = {
        enable = true;
        plugins = with pkgs.obs-studio-plugins; [
            wlrobs
            obs-backgroundremoval
            obs-pipewire-audio-capture
        ];
    };

    programs.git = {
        enable = true;
        settings.user = {
            email = "cryptokell@tutanota.com";
            name = "LibreKosei";
        };
    };

    programs.direnv = {
        enable = true;
        enableZshIntegration = true;
        nix-direnv.enable = true;
    };

    programs.eza = {
        enable = true;
        colors = "always";
        icons = "always";
    };

    programs.yazi = {
        enable = true;
        settings = {
            manager = {
                show_hidden = false;
                sort_dir_first = true;
            };
        };
    };

    dconf.settings = {
        "org/virt-manager/virt-manager/connections" = {
            autoconnect = ["qemu:///system"];
            uris = ["qemu:///system"];
        };
    };
}
