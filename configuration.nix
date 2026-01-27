{ config, inputs, lib, pkgs, options, ... }:
{
    imports = [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
        ./system
    ];

    # Use the systemd-boot EFI boot loader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "nixos"; # Define your hostname.
    # Pick only one of the below networking options.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

    nixpkgs.config.allowUnfree = true;

    # global.fonts.enable = true;
    # global.bluetooth.enable = true;

    global = {
        core = {
            fonts.enable = true;
            bluetooth.enable = true;
            audio.enable = true;
            power = {
                enable = true;
                acpid.enable = true;
                tlp.enable = true;
            };
            locale.enable = true;
            networking = {
                enable = true;
                tailscale.enable = true;
            };
            vm.enable = false;
            zsh.enable = true;
        };
        
        desktop = {
            hyprland = {
                enable = true;
                hyprlock.enable = true;
                hypridle.enable = true;
            };
            foot.enable = true;
            qt.enable = true;
        };

        utils = {
            nh.enable = true;
            wireshark.enable = true;
        };

        games = {
            minecraft.enable = true;
        };
        # fonts.enable = true;
        # bluetooth.enable = true;
        # games = {
        #     minecraft.enable = true;
        # };
        # audio.enable = true;
    };
  
    users.defaultUserShell = pkgs.zsh;

    # Enable touchpad support (enabled default in most desktopManager).
    services.libinput.enable = true;

    services.resolved.enable = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.kosei = {
        isNormalUser = true;
        extraGroups = [ "wheel" "libvirtd" "wireshark" "networkmanager" ]; # Enable ‘sudo’ for the user.
        packages = with pkgs; [
            tree
        ];
        shell = pkgs.zsh;
    };

    environment.systemPackages = with pkgs; [
        vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
        wget
        wireguard-tools
    ];

    system.stateVersion = "24.11"; # Did you read the comment?

    nix.settings.experimental-features = ["nix-command" "flakes"];

    services.udev.extraRules = ''
        #Enable user access to keyboard using uinput event generator
        SUBSYSTEM=="misc", KERNEL=="uinput", OPTIONS+="static_node=uinput", TAG+="uaccess"
    '';

    services.upower.enable = true;

    security.polkit.enable = true;

    # time 
    time.timeZone = "Asia/Kuala_Lumpur";

    hardware.opentabletdriver.enable = true;
    hardware.uinput.enable = true;
    boot.kernelModules = [ "uinput" ];
}


