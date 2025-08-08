{
  config,
  pkgs,
  ...
}: {
  home.file.".config/polybar/config.ini".source = ./config.ini;
  catppuccin.polybar = {
    enable = true;
    flavor = "mocha";
  };
}
