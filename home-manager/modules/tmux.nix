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

    # Ctrl + R: history
    extraConfig = ''
      set -as terminal-features ",kitty*:rgb"
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
### Notes & Todos 

# Ghi chú ý tưởng (tạo file mới theo giờ)
bind -r e split-window -h "nvim ~/notes/notes_$(date +'%y%m%d%H').md"

# Todo list chung (luôn mở file todo.md)
bind -r o split-window -h "nvim ~/notes/todo.md"
      # Copy vim  movements
      set-window-option -g mode-keys vi
      bind-key -T root C-n copy-mode
      bind -T copy-mode-vi v send -X begin-selection
      bind -T copy-mode-vi y send -X copy-pipe-and-cancel "xclip -selection clipboard"


      set -g status-interval 300 
      set -g status-justify centre # center align window list
      set -g status-left-length 200
      set -g status-right-length 140
      set -g status-left '#[fg=white]#(curl -s 'wttr.in?format=3')#[default]'
      # set -g status-right "#(head -n 1 ~/notes/todo.md 2>/dev/null || echo 'No TODO') #[fg=white,bg=default]%a %l:%M %p#[default] #[fg=blue]%d/%m/%y"

      set -g status-right "#[fg=white,bg=default]%a %l:%M %p #[fg=blue]%d/%m/%y #[fg=green]#(echo bat: $(acpi -b | grep -oP '\\d+%' | head -1))"
      # set -g status-right '#[fg=white,bg=default]%a%l:%M %p#[default] #[fg=blue]%d/%m/%y'
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

