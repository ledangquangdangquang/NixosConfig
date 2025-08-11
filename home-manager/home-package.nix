{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    htop
    pavucontrol
    neofetch
    python314
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    tree
    bat
    xclip
    polybarFull
    # --- Vietnamese tool ---
    fcitx5-unikey
    fcitx5-gtk # for gtk app
    # --- Wallpaper ---
    feh
    # --- Music ---
    mpc
    # --- File manager ---
    xfce.xfce4-panel # XFCE Panel
    xfce.thunar
    gvfs
    udisks2
    xfce.thunar-volman
    xfce.tumbler
    # --- Screenshot ---
    gnome-screenshot
    # --- Lsp ---
    nixd
    alejandra
    libreoffice
  ];
}
