{config, pkgs, ...}:
{
    programs.foot = {
        enable = true;
        theme = "catppuccin-frappe";
        settings = {
            main = {
                font = "monospace:size=13";
            };
        };
    };
}
