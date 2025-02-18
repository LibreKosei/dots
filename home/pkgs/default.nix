{config, pkgs, ...}:
{
  imports = [
    ./browsers
    ./games
    ./obsidian
  ];

  home.packages = with pkgs; [
      github-desktop
      nautilus
  ];
}
