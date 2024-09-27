{
  description = "Main NixOS configuration Flake";

  inputs  = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = { 
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
    settings = import ./hosts/laptop/settings.nix;
    extensions = inputs.nix-vscode-extensions.extensions.${system};
    args = { inherit inputs; inherit settings; inherit extensions; };
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = args;
      modules = [
        ./configs/common/configuration.nix
        inputs.stylix.nixosModules.stylix
        inputs.home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";
            extraSpecialArgs = args;
            users.matteo = import ./configs/common/home.nix;
          };
        }
      ];
    };
  };
}
