{config, lib, options, ...}:
let 
    cfg = config.global.desktop.foot;
in
{
    options.global.desktop.foot = {
        enable = lib.mkEnableOption "Foot terminal";
    };

    config = lib.mkIf cfg.enable {
        programs.foot = {
            enable = true;
            theme = "catppuccin-frappe";
            settings = {
                main = {
                    font = "monospace:size=13";
                };
            };
        };
    };
}
