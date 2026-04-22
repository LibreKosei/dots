{pkgs, config, ...}:
{
    nixpkgs.config = {
        allowUnfree = true;
    };
    home.packages = [
        pkgs.obsidian
    ];
}
