{
	programs.bash = {
		enable = true;
		initExtra = ''
			export EDITOR=nvim
		'';
		shellAliases = {
			home-rebuild = "home-manager switch --flake ./";
			nixos-rebuild = "nixos-rebuild switch --flake ./";
		};
	};
}
