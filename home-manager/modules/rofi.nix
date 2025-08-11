{
  pkgs,
  catppuccin,
  inputs,
  ...
}: {
  catppuccin.rofi = {
    enable = true;
    flavor = "mocha";
  };

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    extraConfig = {
      modi = "drun";
      icon-theme = "Numix-Circle";
      font = "JetBrains Mono Regular 13";
      show-icons = true;
      terminal = "wezterm";
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      sidebar-mode = true;
      border-radius = 10;
      # modi = "drun";
      # show-icons = true;
      # drun-display-format = "{icon} {name}";
      # disable-history = false;
      # hide-scrollbar = true;
      # display-drun = "   Apps ";
      # sidebar-mode = true;
    };
  };

  home.packages = [pkgs.bemoji];
}
