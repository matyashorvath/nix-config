{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs-stable.url = "github:Nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:Nixos/nixpkgs/nixos-unstable";

    # Set the default channel
    nixpkgs.follows = "nixpkgs-unstable";

    home-manager = {
      # url = "github:nix-community/home-manager/release-24.11";
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    alejandra.url = "github:kamadorueda/alejandra/3.1.0";
    alejandra.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-stable,
    nixpkgs-unstable,
    home-manager,
    alejandra,
    ...
  }: let
    lib = nixpkgs.lib;
    lib-stable = nixpkgs-stable.lib;
    lib-unstable = nixpkgs-unstable.lib;

    system = "x86-64-linux";
    username = "matyashorvath";

    specialArgs = {
      inherit inputs;

      pkgs-stable = {
        inherit system;
        config.allowUnfree = true;
      };

      pkgs-unstable = {
        inherit system;
        config.allowUnfree = true;
      };
    };
  in {
    nixosConfigurations = {
      latitude = let
        hostname = "latitude";
      in
        lib.nixosSystem {
          inherit system;
          inherit specialArgs;
          modules = [
            ./hosts/${hostname}/system
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${username} = import ./hosts/${hostname}/home/home.nix;
                extraSpecialArgs = {inherit inputs;};
              };
            }
          ];
        };
    };
  };
}
