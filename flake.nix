{
    description = "My nixos configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager/master";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        icon-browser = {
            url = "github:aylur/icon-browser";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        quickshell = {
            url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nixcraft = {
            url = "github:loystonpais/nixcraft";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs: 
        let
            system = "x86_64-linux";
            lib = nixpkgs.lib;
            pkgs = nixpkgs.legacyPackages.${system};
        in
        {
            nixosConfigurations = {
                nixos = lib.nixosSystem {
                    inherit system;
                    specialArgs = {inherit inputs;};
                    modules = [ 
                        ./configuration.nix
                        ./modules/nixos
                    ];
                };
            };

            homeConfigurations = {
                kosei = home-manager.lib.homeManagerConfiguration {
                    inherit pkgs;
                    extraSpecialArgs = { inherit inputs; };
                    modules = [ ./home.nix ];
                };
            };

        };
}
