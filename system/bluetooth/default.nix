{config, pkgs, ...}:
{
  users.users.kosei.packages = with pkgs; [
    gnome-bluetooth
  ];

  hardware.bluetooth = {
      enable = true;
      settings = {
          General = {
              Name = "Hello";
              ControllerMode = "dual";
              FastConnectable = "true";
              Experimental = "true";
          };
          Policy = {
              AutoEnable = true;
          };
      };
  };
  services.blueman.enable = true;
  hardware.bluetooth.package = pkgs.bluez;
}
