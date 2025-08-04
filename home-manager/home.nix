{inputs, homeStateVersion, user, ... }: {
	imports = [
		./modules
		./home-package.nix
		inputs.catppuccin.homeModules.catppuccin
	];
	home-manager.backupFileExtension = "backup";
	home = {
		username = user;
		homeDirectory = "/home/${user}";
		stateVersion = homeStateVersion;
	};
}
