{config, pkgs, ...}:
{
    gtk = {
        enable = true;
        iconTheme = {
            name = "Papirus";
            package = pkgs.papirus-icon-theme;
        };
        theme = {
            name = "materia";
            package = pkgs.materia-theme;
        };
        font.name = "monospace";
        cursorTheme = {
            name = "Bibata-Modern-Amber";
            size = 24;
            package = pkgs.bibata-cursors;
        };
    };
    home = {
        pointerCursor = {
            name = "Bibata-Modern-Amber";
            package = pkgs.bibata-cursors;
            size = 24;
        };
    };
}
