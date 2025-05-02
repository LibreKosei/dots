{inputs, config, pkgs, ...}:
    let
        symlink = config.lib.file.mkOutOfStoreSymlink;
        home = config.home.homeDirectory;
    in 
{
    imports = [inputs.ags.homeManagerModules.default];

    programs.ags = {
        enable = true;

        extraPackages = with pkgs; [
            inputs.ags.packages.${pkgs.system}.battery
            inputs.ags.packages.${pkgs.system}.apps
            inputs.ags.packages.${pkgs.system}.auth
            inputs.ags.packages.${pkgs.system}.notifd
            inputs.ags.packages.${pkgs.system}.network
            inputs.ags.packages.${pkgs.system}.bluetooth
            inputs.ags.packages.${pkgs.system}.hyprland
            inputs.ags.packages.${pkgs.system}.wireplumber
            inputs.ags.packages.${pkgs.system}.tray
            fzf
            gtksourceview
            accountsservice
        ];
    };

    xdg.configFile.ags = {
        recursive = true;
        source = symlink "${home}/.dotfiles/home/programs/ags/config";
    };

    home.packages = with pkgs; [
        material-symbols
        inputs.ags.packages.${pkgs.system}.notifd
    ];
}
