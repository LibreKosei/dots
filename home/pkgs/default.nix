{config, pkgs, ...}:
{
  imports = [
    ./browsers
    ./games
  ];

  home.packages = with pkgs; [
      github-desktop
  ];
}
