{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    localsend
    octaveFull
    htop
    nodejs_24
    acpi
    virtualbox
    obsidian
    pavucontrol
    wget
    neofetch
    unzip
    python314
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    tree
    bat
    xclip
    deno
    polybarFull
    # --- Vietnamese tool ---
    fcitx5-unikey
    fcitx5-gtk # for gtk app
    # --- Wallpaper ---
    feh
    # --- Music ---
    mpv
    mpd
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
    jellyfin-ffmpeg
    # --- Lsp ---
    nixd
    alejandra
    prettier
    libreoffice
    # --- Notification volume ---
    pamixer # control volume cli
    libnotify # send Notification
    # --- Messager ---
    discord
    telegram-desktop
    # --- Lock ---
    scrot
    imagemagick
    i3lock-fancy-rapid
  ];
}
