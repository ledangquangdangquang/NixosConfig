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

  gtk = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "lavender";
      };
    };
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
    cursorTheme = {
      name = "catppuccin-cursors";
      package = pkgs.catppuccin-cursors.mochaMauve;
      size = 30;
    };
  };

  home.pointerCursor = {
    name = "catppuccin-cursors";
    package =  pkgs.catppuccin-cursors.mochaMauve;
    size = 22;
  };
}
