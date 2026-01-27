{lib, config, pkgs, ...}:
let 
    cfg = config.global.core.fonts;
in
{
    options = {
        # addNerdFonts = lib.mkOption {
        #     type = lib.types.bool;
        #     default = lib.mkDefault true;
        # };
        global.core.fonts = {
            enable = lib.mkOption {
                type = lib.types.bool;
                default = true;
                description = "Enable my custom fonts";
            };
            extraFonts = lib.mkOption {
                type = lib.types.listOf lib.types.package;
                default = [];
                description = "Extra fonts to install";
            };
        };
    };

    config = lib.mkIf cfg.enable {
        fonts = {
            packages = with pkgs; [
                fira-code
                fira-code-symbols
                font-awesome
                noto-fonts-color-emoji
                noto-fonts-cjk-sans
                nerd-fonts.jetbrains-mono
                corefonts
                vista-fonts
                ibm-plex
            ] ++ cfg.extraFonts;
            fontDir.enable = true;
            fontconfig = {
                defaultFonts.monospace = ["JetBrainsMono Nerd Font"];
            };
        }; 
    };
}
