{config, lib, options, ...}:
let 
    cfg = config.modules.desktop.foot;
in
{
    options.modules.desktop.foot = {
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
