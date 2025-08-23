{ pkgs, catppuccin, inputs, config, ... }: let
  themePath = "${config.home.homeDirectory}/.config/rofi/tokyonight.rasi";
in {
  # catppuccin.rofi = {
  #   enable = true;
  #   flavor = "mocha";
  # };

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
    };

    theme = themePath;
  };

  # Copy theme file vào đúng chỗ
  home.file.".config/rofi/catppuccin.rasi".source = ./catppuccin.rasi;
  # home.file.".config/rofi/tokyonight.rasi".source = ./tokyonight.rasi;

  home.packages = [ pkgs.bemoji ];
}
