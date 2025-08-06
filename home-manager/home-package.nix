{ pkgs, ... }: {
	nixpkgs.config.allowUnfree = true;
	home.packages = with pkgs; [
		htop
		neofetch
		python314
		nerd-fonts.fira-code
		nerd-fonts.jetbrains-mono
		tree
		xclip
		polybarFull
		# Vietnamese tool
		fcitx5
		fcitx5-unikey
		libsForQt5.fcitx5-qt
		fcitx5-configtool
		# Wallpaper
		feh
		# Mucic
		mpc
		# File manager
		xfce.xfce4-panel   # XFCE Panel
		xfce.thunar
		gvfs
		udisks2
		xfce.thunar-volman
		xfce.tumbler
		# Screenshot
		gnome-screenshot
    # Lsp
    nixd
alejandra
	];
}
