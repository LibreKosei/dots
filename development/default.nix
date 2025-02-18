{config, pkgs, options, ...}:
{
    home.packages = with pkgs; [
        deno
        nodejs
    ];
}
