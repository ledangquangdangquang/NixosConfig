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
      terminal = "kitty";
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      sidebar-mode = true;
      border-radius = 10;
    };
  };

  home.packages = [pkgs.bemoji];
}
