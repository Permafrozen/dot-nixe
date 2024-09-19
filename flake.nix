{
  description = "Main NixOS configuration Flake";

  inputs  = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@Inputs:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.matteo = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [ 
        ./configs/common/configuration.nix 
        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
            users.matteo = import ./configs/common/home.nix;
          };
        }
      ];
    };
  };
}
