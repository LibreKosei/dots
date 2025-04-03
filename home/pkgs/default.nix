{config, pkgs, ...}:
{
  imports = [
    ./browsers
    ./games
    ./obsidian
    ./unfree
  ];

  home.packages = with pkgs; [
      github-desktop
      bitwarden
      nautilus
  ];
}
