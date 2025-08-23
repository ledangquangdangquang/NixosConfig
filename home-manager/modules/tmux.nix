{ pkgs, ... }: {
catppuccin.tmux = {
  enable = true;
  flavor = "mocha";
};
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    mouse = true;
    escapeTime = 0;
    keyMode = "vi";
    terminal = "screen-256color";

    extraConfig = ''
      set -as terminal-features ",alacritty*:rgb"
      bind -n M-r source-file ~/.config/tmux/tmux.conf \; display "reloaded!"


      # Quick switch to window 1-9
      bind -n M-1 select-window -t 1
      bind -n M-2 select-window -t 2
      bind -n M-3 select-window -t 3
      bind -n M-4 select-window -t 4
      bind -n M-5 select-window -t 5
      bind -n M-6 select-window -t 6
      bind -n M-7 select-window -t 7
      bind -n M-8 select-window -t 8
      bind -n M-9 select-window -t 9

      # Pane navigation
      bind -n M-h select-pane -L
      bind -n M-l select-pane -R
      bind -n M-k select-pane -U
      bind -n M-j select-pane -D

      # Pane resizing
      bind -n M-Left  resize-pane -L 5
      bind -n M-Right resize-pane -R 5
      bind -n M-Up    resize-pane -U 3
      bind -n M-Down  resize-pane -D 3
      bind -n M-m     resize-pane -Z

      # Splits
      bind -n M-s split-window -v
      bind -n M-v split-window -h

      # Open custom windows
      bind -n M-o send-keys "nvim -c 'Telescope find_files'" C-m
      bind -n M-O send-keys "clear && fuzzyvim" C-m
      bind -n M-n new-window

      # Copy vim  movements
      set-window-option -g mode-keys vi
      bind-key -T root C-n copy-mode
      bind -T copy-mode-vi v send -X begin-selection
      bind -T copy-mode-vi y send -X copy-pipe-and-cancel "xclip -selection clipboard"

    '';

    plugins = with pkgs; [
      # tmuxPlugins.gruvbox
      # Optional: Uncomment to enable session restore
      # {
      #   plugin = tmuxPlugins.resurrect;
      #   extraMonfig = "set -g @resurrect-strategy-nvim 'session'";
      # }
      # {
      #   plugin = tmuxPlugins.continuum;
      #   extraMonfig = ''
      #     set -g @continuum-restore 'on'
      #     set -g @continuum-save-interval '60'
      #   '';
      # }
    ];
  };
}

