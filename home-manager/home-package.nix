{ pkgs, ... }: {
	nixpkgs.config.allowUnfree = true;
	home.packages = with pkgs; [
		htop
		neofetch
		nerd-fonts.fira-code
		nerd-fonts.jetbrains-mono
		tree
		wl-clipboard
		
		# --- Hyprland apps ---
		# waybar
		# wofi
		swww
		networkmanagerapplet
		hyprpaper
	];
}
