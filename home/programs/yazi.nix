{config, pkgs, ...}:
{
    programs.yazi = {
        enable = true;
        settings = {
            manager = {
                show_hidden = false;
                sort_dir_first = true;
            };
        };
    };
}
