{config, pkgs, ...}:
{
    nixpkgs.config = {
        allowUnfree = true;
    };

    home.packages = [
        pkgs.obsidian
    ];
}
