{
  description = "Quang NixOS hihi";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    catppuccin = {
      url = "github:catppuccin/nix"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:gerg-l/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons  = {
      url = "gitlab:rycee/nur-expressions/master?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, catppuccin, home-manager, firefox-addons, ... } @inputs:
  # outputs = inputs:
    let
      system = "x86_64-linux";
      homeStateVersion = "25.05";
      user = "quang";

      hostMain = { hostname = "nixos"; stateVersion = "24.11"; };
      hostVM   = { hostname = "nixos-vm"; stateVersion = "25.05"; };
    in {
      nixosConfigurations = {
        "${hostMain.hostname}" = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [ ./hosts/nixos/configuration.nix ];
        };

        "${hostVM.hostname}" = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [ ./hosts/nixos-vm/configuration.nix ];
        };
      };

      homeConfigurations."${user}@${hostMain.hostname}" =
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = { 
	    inherit inputs homeStateVersion user;
	    catppuccin = inputs.catppuccin;
	    firefox-addons = inputs.firefox-addons.packages.${system};
	  };
          modules = [ ./home-manager/home.nix ];
        };

      homeConfigurations."${user}@${hostVM.hostname}" =
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = { 
	    inherit inputs homeStateVersion user;
	    firefox-addons = inputs.firefox-addons.packages.${system};
	    catppuccin = inputs.catppuccin;
	  };
          modules = [ ./home-manager/home-vm.nix ];
        };
	home-manager.backupFileExtension = "backup";
    };
}

