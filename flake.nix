{
	description = "Quang NixOS hihi";
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager/master";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		# hyprland = {
		# 	url = "github:hyprwm/Hyprland";
		# 	inputs.nixpkgs.follows = "nixpkgs";
		# };
	};

	outputs = { self, nixpkgs, home-manager,  ... } @inputs: 
		let
			system = "x86_64-linux";
			homeStateVersion = "25.05";
			user = "quang";
			host = { hostname = "nixos"; stateVersion = "24.11"; };
		in {
		nixosConfigurations = {
			"${host.hostname}" = nixpkgs.lib.nixosSystem {
				inherit system;
				specialArgs = { inherit inputs; };
				modules = [./hosts/nixos/configuration.nix];
			};
		};
		homeConfigurations."${user}@${host.hostname}" = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.${system};
			extraSpecialArgs = {
				inherit inputs homeStateVersion user;
			};

			modules = [
				./home-manager/home.nix
			];
		};
	};
}

