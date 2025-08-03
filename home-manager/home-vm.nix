{ homeStateVersion, pkgs, home-manager,  user, ... }: {
	imports = [
		./modules
		./home-package.nix
	];

	home = {
		username = user;
		homeDirectory = "/home/${user}";
		stateVersion = homeStateVersion;
		sessionVariables = {
			GTK_IM_MODULE = "fcitx";
			QT_IM_MODULE = "fcitx";
			XMODIFIERS = "@im=fcitx";
			INPUT_METHOD = "fcitx";
			XDG_DATA_DIRS = "${pkgs.fcitx5-unikey}/share:$XDG_DATA_DIRS";
		};
	};

}
