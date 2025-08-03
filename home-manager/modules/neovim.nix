{pkgs, ...}:
{
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
		vimAlias = true;
		extraConfig = ''
			set number
			set cc=100
			set list
			set listchars=tab:\|\ ,trail:·,nbsp:␣
			set fillchars+=eob:\ 
			set clipboard=unnamedplus
			if &diff
			  colorscheme blue
			else
			  colorscheme catppuccin_mocha
			endif
		'';	
		
		plugins = with pkgs.vimPlugins; [
			gruvbox-material
			catppuccin-vim
			hardtime-nvim
			render-markdown-nvim
			transparent-nvim
			neoscroll-nvim
		];

		extraLuaConfig = ''
			require('neoscroll').setup({
			      easing_function = "sine",
			      hide_cursor = true,
			      stop_eof = true,
			      respect_scrolloff = false,
			      cursor_scrolls_alone = true
			})
		'';
	};
}

