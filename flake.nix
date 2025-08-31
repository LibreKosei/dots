{
    description = "My nixos configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager/master";
            inputs.nixpkgs.follows = "nixpkgs";
        };
 
        ags.url = "github:aylur/ags";

        zen-browser.url = "github:0xc000022070/zen-browser-flake";

        icon-browser = {
            url = "github:aylur/icon-browser";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        quickshell = {
            url = "github:cpwrs/quickshell/nm";
            inputs.nixpkgs.follows = "nixpkgs";
        };
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
                modules = [ ./configuration.nix ];
            };
        };

        homeConfigurations = {
            kosei = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                extraSpecialArgs = { inherit inputs; };
                modules = [ ./home.nix ];
            };
        };

        fotmatter.${system} = pkgs.nixfmt-rfc-style;
    };
}
