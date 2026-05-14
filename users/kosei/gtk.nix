{config, pkgs, ...}:
let 
    neuwaita = pkgs.callPackage ./packages/neuwaita.nix {};
in
{
    gtk = {
        gtk4.theme = null;
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
            # kdePackages.breeze-icons
            # hicolor-icon-theme
            adwaita-icon-theme
            adwaita-icon-theme-legacy
            fluent-icon-theme
            kora-icon-theme
            # neuwaita
            # tela-icon-theme
            # tela-circle-icon-theme
            kora-icon-theme
            # numix-icon-theme
            # numix-icon-theme-circle
            # numix-icon-theme-square
        ];
        pointerCursor = {
            name = "Bibata-Modern-Amber";
            package = pkgs.bibata-cursors;
            size = 24;
        };
    };
}
