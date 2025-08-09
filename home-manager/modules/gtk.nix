{
  pkgs,
  config,
  ...
}: {
  fonts.fontconfig.enable = true;
  home.packages = [
    # pkgs.nerdfonts
    pkgs.twemoji-color-font
    pkgs.noto-fonts-emoji
    pkgs.nerd-fonts.noto
    pkgs.nerd-fonts.jetbrains-mono
  ];

  catppuccin.gtk = {
    icon = {
      enable = true;
      flavor = "mocha";
    };
  };
  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-frappe-blue-standard";
      package = pkgs.catppuccin-gtk;
    };
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
    cursorTheme = {
      name = "Catppuccin-Mocha-Mauve-Cursors";
      size = 24;
      package = pkgs.catppuccin-cursors.mochaDark;
    };
  };

  home.pointerCursor = {
    name = "Catppuccin-Mocha-Dark-Cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 16;
  };
}
