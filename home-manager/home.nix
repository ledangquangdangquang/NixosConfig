{ homeStateVersion, user, ... }: {
	imports = [
		./modules
		./home-package.nix
	];

	home = {
		username = user;
		homeDirectory = "/home/${user}";
		stateVersion = homeStateVersion;
	};
}
