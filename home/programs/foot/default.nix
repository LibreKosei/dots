{config, options, pkgs, ...}:
{
    programs.foot = {
        enable = true;
        theme = "material-design";
        settings = {
            main = {
                font = "monospace:size=13";
            };
        };
    };
}
