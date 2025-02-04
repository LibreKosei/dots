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
  };
}
