{ config, pkgs, lib, options, ... }:
let 
    cfg = config.global.core.networking;
in
{
    options.global.core.networking = {
        enable = lib.mkEnableOption "Networking settings";
        tailscale.enable = lib.mkEnableOption "Tailscale setting";
    };

    config = lib.mkIf cfg.enable (lib.mkMerge [
        {
            networking.firewall = {
                # enable the firewall
                enable = true;

                # always allow traffic from your Tailscale network
                # trustedInterfaces = [ "tailscale0" ];
                trustedInterfaces = lib.mkIf cfg.tailscale.enable ["tailscale0"];

                # allow the Tailscale UDP port through the firewall
                # allowedUDPPorts = [ config.services.tailscale.port ];
                allowedUDPPorts = lib.mkIf cfg.tailscale.enable [ 41641 ];

                allowedTCPPorts = [ 22 ];

                allowedTCPPortRanges = [
                    { from = 1714; to = 1764; } # KDE Connect
                ];
                allowedUDPPortRanges = [
                    { from = 1714; to = 1764; } # KDE Connect
                ];
            };
        }
        (lib.mkIf cfg.tailscale.enable {
            networking.firewall.trustedInterfaces = [ "tailscale0" ];
            networking.firewall.allowedUDPPorts = [ 41641 ];
            
            services.tailscale = {
                enable = true;
                useRoutingFeatures = "both";
            };
            
            environment.systemPackages = [ pkgs.tailscale ];
        })
    ]);
    # KDE Connect
    # programs.kdeconnect.enable = true;
    # make the tailscale command usable to users
    # environment.systemPackages = [ pkgs.tailscale ];

    # enable the tailscale service
    # services.tailscale.enable = true;
    # services.tailscale.useRoutingFeatures = "both";
}
