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
        packages = with pkgs; [
            vimix-icon-theme
            qogir-icon-theme
            dracula-icon-theme
            candy-icons
            whitesur-icon-theme
            morewaita-icon-theme
            gnome-icon-theme
            kdePackages.breeze-icons
            hicolor-icon-theme
            adwaita-icon-theme
            adwaita-icon-theme-legacy
            fluent-icon-theme
        ];
        pointerCursor = {
            name = "Bibata-Modern-Amber";
            package = pkgs.bibata-cursors;
            size = 24;
        };
    };
}
