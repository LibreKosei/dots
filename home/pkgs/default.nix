{config, pkgs, ...}:
{
    imports = [
        ./browsers
        ./game.nix
        ./unfree.nix
        ./aesthetic.nix
    ];
}
