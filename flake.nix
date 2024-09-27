{
  description = "Main NixOS configuration Flake";

  inputs  = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = { 
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
    settings = import ./hosts/laptop/settings.nix;
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; inherit settings; };
      modules = [
        ./configs/common/configuration.nix
        inputs.stylix.nixosModules.stylix
        inputs.home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; inherit settings; };
            users.matteo = import ./configs/common/home.nix;
          };
        }
      ];
    };
  };
}
