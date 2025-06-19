{pkgs, config, ...}:
{
    environment.systemPackages = with pkgs; [
        wireguard-tools
    ];
}
