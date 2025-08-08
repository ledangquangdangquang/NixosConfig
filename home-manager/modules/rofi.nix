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
      show-icons = true;
      drun-display-format = "{icon} {name}";
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      sidebar-mode = true;
    };
  };

  home.packages = [pkgs.bemoji];
}
