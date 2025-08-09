{
  programs.zsh = {
    enable = true;
    # enableCompletions = true;
    syntaxHighlighting.enable = true;
    initContent = ''
      export EDITOR=nvim
      fuzzyvim() {
        local file
        file=$(find . -type f \
          | fzf --layout=reverse \
                --height=80% \
                --preview 'bat --style=numbers --color=always {}' \
                --preview-window=right:60%) || return
        nvim "$file"
      }
      if command -v tmux >/dev/null 2>&1; then
        if [[ -z "$TMUX" ]] && [[ -n "$PS1" ]]; then
          tmux attach-session -t default || tmux new-session -s default
        fi
      fi
    '';
    zplug = {
      enable = true;
      plugins = [
        {name = "zsh-users/zsh-autosuggestions";}
      ];
    };
    shellAliases = {
      home-rebuild-vm = "home-manager switch --flake ./#quang@nixos-vm -b backup";
      home-rebuild = "home-manager switch --flake ./#quang@nixos -b backup";
      nixos-rebuild = "sudo nixos-rebuild switch --flake ./#nixos";
      nixos-rebuild-vm = "sudo nixos-rebuild switch --flake ./#nixos-vm";
      y = "yazi";
    };
    history.size = 10000;
  };
}
