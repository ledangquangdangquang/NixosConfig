{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    mouse = true;
    escapeTime = 0;
    keyMode = "vi";
    terminal = "screen-256color";
    extraConfig = ''
      set -as terminal-features ",alacritty*:RGB"
      bind -n M-r source-file ~/.config/tmux/tmux.conf \; display "Reloaded!"
      bind C-p previous-window
      bind C-n next-window

      bind -n M-1 select-window -t 1
      bind -n M-2 select-window -t 2
      bind -n M-3 select-window -t 3
      bind -n M-4 select-window -t 4
      bind -n M-5 select-window -t 5
      bind -n M-6 select-window -t 6
      bind -n M-7 select-window -t 7
      bind -n M-8 select-window -t 8
      bind -n M-9 select-window -t 9

      bind -n M-h select-pane -L
      bind -n M-l select-pane -R
      bind -n M-k select-pane -U
      bind -n M-j select-pane -D

      bind -n M-S-h resize-pane -L 5
      bind -n M-S-l resize-pane -R 5
      bind -n M-S-k resize-pane -U 3
      bind -n M-S-j resize-pane -D 3

      bind -n M-s split-window -v
      bind -n M-v split-window -h

      bind -n M-o new-window -c ~/para "nvim -c 'Telescope find_files' '0 Inbox/todolist.md'"
      bind -n M-f new-window -c ~/flake "nvim -c 'Telescope find_files' flake.nix"
      bind -n M-n new-window -c ~/.config/nvim "nvim -c 'Telescope find_files' init.lua"
      bind -n M-Enter new-window
      bind -n M-c kill-pane
      bind -n M-q kill-window
      bind -n M-Q kill-session
    '';
    plugins = with pkgs; [
      tmuxPlugins.gruvbox
      # {
      #   plugin = tmuxPlugins.resurrect;
      #   extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      # }
      # {
      #   plugin = tmuxPlugins.continuum;
      #   extraConfig = ''
      # set -g @continuum-restore 'on'
      # set -g @continuum-save-interval '60' # minutes
      #   '';
      # }
    ];
  };
}
