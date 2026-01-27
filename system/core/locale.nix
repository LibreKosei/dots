{config, pkgs, options, lib, ...}:
let 
    cfg = config.global.core.locale;
in
{
    options.global.core.locale = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Enable Japanese input method";
        };
    };
    config = lib.mkIf cfg.enable {
        i18n = {
            defaultLocale = "en_US.UTF-8";
            inputMethod = {
                type = "fcitx5";
                enable = true;
                fcitx5.addons = with pkgs; [
                    fcitx5-mozc
                    fcitx5-gtk
                ];
            };
        };
    };
}
