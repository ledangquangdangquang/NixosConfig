{ pkgs, ... }: {
	nixpkgs.config.allowUnfree = true;
	home.packages = with pkgs; [
		htop
		neofetch
		nerd-fonts.fira-code
		tree
		wl-clipboard
		kitty
		waybar
	];
}
