{
  description = "Home Manager configuration";

  inputs = {
    nix.url = "https://flakehub.com/f/DeterminateSystems/nix/2.0";

    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    devenv.url = "github:cachix/devenv/v1.3.1";


    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs =
    { self
    , nix
    , nixpkgs
    , nix-darwin
    , home-manager
    , devenv
    , sops-nix
    , ...
    }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      extraArgs = {
        inherit sops-nix;
        flake = self;
      };
    in
    {
      defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
      defaultPackage.aarch64-darwin = home-manager.defaultPackage.aarch64-darwin;
      defaultPackage.x86_64-darwin = home-manager.defaultPackage.x86_64-darwin;

      darwinConfigurations = {
        arceus = nix-darwin.lib.darwinSystem {
          specialArgs = extraArgs // {
            remapKeys = false;
          };
          system = "aarch64-darwin";
          modules = [
            ./systems/arceus
            home-manager.darwinModules.default
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = extraArgs;
            }
            nix.darwinModules.default
          ];
        };
      };
    };
}
