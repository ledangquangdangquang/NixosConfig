{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Packages in each category are sorted alphabetically
	htop
	neofetch
	nerd-fonts.fira-code
	tree
	wl-clipboard
  ];
}
