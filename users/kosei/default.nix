{ inputs, config, pkgs, pkgs-old, ... }:
{
    home.username = "kosei";
    home.homeDirectory = "/home/kosei";

    imports = [ 
        ./gtk.nix
        ./neovim
        ./zsh
        ./tmux.nix
        ./kitty.nix
    ];

    home.stateVersion = "24.11"; # Please read the comment before changing.

    nixpkgs.config = {
        allowUnfree = true;
    };

    home.packages = with pkgs; [
        # Shell
        starship

        # Editors
        inputs.kvim.packages.${pkgs.stdenv.hostPlatform.system}.default

        # Utilities
        brightnessctl
        dart-sass
        wl-clipboard
        killall
        libnotify
        unzip
        zip
        htop
        jq
        libinput
        libwacom
        pavucontrol

        # Desktop 
        libreoffice
        nautilus   
        signal-desktop
        xournalpp
        saber
        qt6Packages.qt6ct
        inputs.icon-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
        ptyxis
        pkgs-old.rnote
        addwater
        bookup
        dissent
        inputs.concord.packages.${pkgs.stdenv.hostPlatform.system}.default

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
        (inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default.withModules [
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

    programs.librewolf = {
        enable = true;
        settings = {
            "privacy.clearOnShutdown.cookies" = true;
        };
    };

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
        shellWrapperName = "y";
        settings = {
            manager = {
                show_hidden = false;
                sort_dir_first = true;
            };
        };
    };

    programs.fzf = {
        enable = true;
        enableZshIntegration = true;
    };

    programs.zoxide = {
        enable = true;
        enableZshIntegration = true;
    };

    programs.lazygit = {
        enable = true;
        enableZshIntegration = true;
    };

    dconf.settings = {
        "org/virt-manager/virt-manager/connections" = {
            autoconnect = ["qemu:///system"];
            uris = ["qemu:///system"];
        };
    };
}
