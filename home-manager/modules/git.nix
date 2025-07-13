{
	programs.git = {
		enable = true;
		userName = "ledangquangdangquang";
		userEmail = "quang.ld224113@sis.hust.edu.vn";
		extraConfig = { 
			init.defaultBranch = "main";
			credential.helper = "store";
		};
	};
	programs.ssh = {
		enable = true;
		extraConfig = ''
			Host github.com
			IdentityFile ~/.ssh/id_ed25519
			User git
		'';
	};

	services.ssh-agent.enable = true;
}
