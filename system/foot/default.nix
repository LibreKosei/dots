{config, pkgs, ...}:
{
    programs.foot = {
        enable = true;
        theme = "ayu-mirage";
        settings = {
            main = {
                font = "monospace:size=13";
            };
        };
    };
}
