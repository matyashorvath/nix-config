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

    hyprland.url = "github:hyprwm/Hyprland";
    hyprpaper.url = "github:hyprwm/hyprpaper";
    hyprpicker.url = "github:hyprwm/hyprpicker";

    alejandra.url = "github:kamadorueda/alejandra/3.1.0";
    alejandra.inputs.nixpkgs.follows = "nixpkgs-unstable";
    catppuccin.url = "github:catppuccin/nix";

    winapps = {
      url = "github:winapps-org/winapps";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-stable,
    nixpkgs-unstable,
    home-manager,
    hyprland,
    hyprpaper,
    hyprpicker,
    alejandra,
    catppuccin,
    winapps,
    ...
  }: let
    lib = nixpkgs.lib;
    lib-stable = nixpkgs-stable.lib;
    lib-unstable = nixpkgs-unstable.lib;

    system = "x86_64-linux";
    username = "matyashorvath";

    inherit inputs;

    pkgs-stable = import nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
    };
    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations = {
      latitude = let
        hostname = "latitude";
      in
        lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit system;
            inherit pkgs-stable;
            inherit pkgs-unstable;
          };
          modules = [
            ./hosts/${hostname}/system
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${username} = {
                  imports = [
                    ./hosts/${hostname}/home/home.nix
                    catppuccin.homeModules.catppuccin
                  ];
                };
                backupFileExtension = "backup";
                extraSpecialArgs = {
                  inherit inputs;
                  inherit pkgs-stable;
                  inherit pkgs-unstable;
                };
              };
            }
          ];
        };
    };
  };
}
