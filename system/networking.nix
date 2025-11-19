{ config, pkgs, ... }:

{
    # KDE Connect
    programs.kdeconnect.enable = true;
  # make the tailscale command usable to users
    environment.systemPackages = [ pkgs.tailscale ];

  # enable the tailscale service
    services.tailscale.enable = true;
# ...

# ...
    networking.firewall = {
        # enable the firewall
        enable = true;

        # always allow traffic from your Tailscale network
        trustedInterfaces = [ "tailscale0" ];

        # allow the Tailscale UDP port through the firewall
        allowedUDPPorts = [ config.services.tailscale.port ];

        allowedTCPPorts = [ 22 ];

        allowedTCPPortRanges = [
            { from = 1714; to = 1764; } # KDE Connect
        ];
        allowedUDPPortRanges = [
            { from = 1714; to = 1764; } # KDE Connect
        ];
    };
    services.tailscale.useRoutingFeatures = "both";
}
