{inputs, homeStateVersion, user, ... }: {
	imports = [
		./modules
		./home-package.nix
    inputs.catppuccin.homeModules.catppuccin
	];
	home = {
		username = user;
		homeDirectory = "/home/${user}";
		stateVersion = homeStateVersion;
	};
}
