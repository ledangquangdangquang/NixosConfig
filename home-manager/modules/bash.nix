{
	programs.bash = {
		enable = true;
		initExtra = ''
			export EDITOR=nvim
		'';
		shellAliases = {
			home-rebuild-vm = "home-manager switch --flake ./#quang@nixos-vm";
			home-rebuild = "home-manager switch --flake ./#quang@nixos";
			nixos-rebuild = "sudo nixos-rebuild switch --flake ./#nixos";
			nixos-rebuild-vm = "sudo nixos-rebuild switch --flake ./#nixos-vm";
			y = "yazi";
		};
	};
}
