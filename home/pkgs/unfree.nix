{pkgs, config, ...}:
{
    nixpkgs.config = {
        allowUnfree = true;
    };
    home.packages = [
        pkgs.zoom-us
        pkgs.obsidian
    ];
}
