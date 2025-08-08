{inputs, homeStateVersion, user, ... }: {
	imports = [
		./modules
		./home-package.nix
	];
	home-manager.backupFileExtension = "backup";
	home = {
		username = user;
		homeDirectory = "/home/${user}";
		stateVersion = homeStateVersion;
	};
}
