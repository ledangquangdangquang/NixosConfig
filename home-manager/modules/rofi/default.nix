{ pkgs, catppuccin, inputs, config, ... }: let
  themePath = "${config.home.homeDirectory}/.config/rofi/tokyonight.rasi";
in {
  # catppuccin.rofi = {
  #   enable = true;
  #   flavor = "mocha";
  # };

  home.file.".config/rofi/scripts/wifi_rofi.sh" = {
    source = ./scripts/wifi_rofi.sh;
    executable = true;  # Cấp quyền chạy cho script
  };
  home.file.".config/rofi/scripts/monitor-mode.sh" = {
    source = ./scripts/monitor-mode.sh;
    executable = true;  # Cấp quyền chạy cho script
  };
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    extraConfig = {
      modi = "drun";
      icon-theme = "Numix-Circle";
      font = "JetBrains Mono Regular 13";
      show-icons = true;
      terminal = "kitty";
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      sidebar-mode = true;
      border-radius = 10;
      kb-remove-to-eol = "";
      kb-accept-entry= "Control+m,Return,KP_Enter";
      kb-row-down = "Control+j,Down";
      kb-row-up = "Control+k,Up";
    };

    theme = themePath;
  };

  # Copy theme file vào đúng chỗ
  home.file.".config/rofi/tokyonight.rasi".source = ./tokyonight.rasi;

  home.packages = [ pkgs.bemoji ];
}
