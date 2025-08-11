{
	programs.git = {
		enable = true;
		userName = "ledangquangdangquang";
		userEmail = "quang.ld224113@sis.hust.edu.vn";
		extraConfig = { 
			init.defaultBranch = "main";
			credential.helper = "store";
		};
		aliases = {
			acp = ''!f() { git add . && git commit -m "$1" && git push; }; f'';
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
	# ssh-keygen -t ed25519 -C "quang.ld224113@sis.hust.edu.vn"
	# cat ~/.ssh/id_ed25519.pub
  # git remote -v
  # git remote set-url origin git@github.com:ledangquangdangquang/NixosConfig.git

	services.ssh-agent.enable = true;
}
