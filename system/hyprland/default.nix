{pkgs, ...}:
{
  programs.hyprland.enable= true;
  xdg.portal = {
      enable = true;
      extraPortals = [
          pkgs.xdg-desktop-portal-gtk
      ];  
  };

  environment.sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
  };

  hardware = {
      graphics.enable = true;
  };
}
