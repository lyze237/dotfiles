{
  description = "Config file";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    solaar = {
      url = "https://flakehub.com/f/Svenum/Solaar-Flake/*.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager"; #/release-24-11
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = inputs@ { nixpkgs, solaar, home-manager, plasma-manager, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.pecks = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [ 
        solaar.nixosModules.default
        ./configuration.nix 
      ];
    };

    homeConfigurations.lyze = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [ 
        inputs.plasma-manager.homeManagerModules.plasma-manager
        ./home/home.nix 
      ];
    };
  };
}

