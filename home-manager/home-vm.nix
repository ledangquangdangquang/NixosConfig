{inputs, homeStateVersion, pkgs, home-manager,  user, ... }: {
	imports = [
		./modules
		./home-package.nix
		inputs.catppuccin.homeModules.catppuccin
	];

	home = {
		username = user;
		homeDirectory = "/home/${user}";
		stateVersion = homeStateVersion;
		sessionVariables = {
			NIXPKGS_ALLOW_UNFREE=1;
			GTK_IM_MODULE = "fcitx";
			QT_IM_MODULE = "fcitx";
			XMODIFIERS = "@im=fcitx";
			INPUT_METHOD = "fcitx";
			XDG_DATA_DIRS = "${pkgs.fcitx5-unikey}/share:$XDG_DATA_DIRS";
		};
	};

}
