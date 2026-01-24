{inputs, config, pkgs, lib, ...}:
{
    imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
    nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];        

    services.minecraft-servers = {
        enable = true;
        eula = true;
        openFirewall = true;

        servers.fabricLatest = {
            enable = true;

            package = pkgs.fabricServers.fabric-1_21_10;

            symlinks = {
                mods = pkgs.linkFarmFromDrvs "mods" (
                    builtins.attrValues {
                        Fabric-API = pkgs.fetchurl {
                            url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/tV4Gc0Zo/fabric-api-0.138.4%2B1.21.10.jar";
                            sha512 = lib.fakeHash;
                        };

                        FerriteCore = pkgs.fetchurl {
                            url = "https://cdn.modrinth.com/data/uXXizFIs/versions/MGoveONm/ferritecore-8.0.2-fabric.jar";
                            sha512 = lib.fakeHash;
                        };
                    }   
                );
            };
        };
    };
}
