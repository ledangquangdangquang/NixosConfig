{
  user,
  hostMain,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  # --- 1. BOOTLOADER (Bắt buộc cho hệ thống EFI) ---
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # --- 2. MẠNG ---
  networking.hostName = "${hostMain.hostname}"; # Tên máy tính của bạn
  # networking.hostName = "nixos";
  networking.networkmanager.enable = true; # Dùng NetworkManager để quản lý WiFi, Ethernet dễ dàng.
  hardware.bluetooth.enable = true;
  # --- 3. THỜI GIAN VÀ NGÔN NGỮ ---
  time.timeZone = "Asia/Ho_Chi_Minh";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "vi_VN";
    LC_IDENTIFICATION = "vi_VN";
    LC_MEASUREMENT = "vi_VN";
    LC_MONETARY = "vi_VN";
    LC_NAME = "vi_VN";
    LC_NUMERIC = "vi_VN";
    LC_PAPER = "vi_VN";
    LC_TELEPHONE = "vi_VN";
    LC_TIME = "vi_VN";
  };

  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-unikey
      fcitx5-gtk
    ];
  };

  # --- 4. MÔI TRƯỜNG ĐỒ HỌA (i3 Window Manager) ---
  services.xserver.enable = true;
  services.xserver.windowManager.i3.enable = true; # Trình quản lý cửa sổ i3
  services.xserver.displayManager.lightdm = {
    enable = true;
    background = pkgs.runCommand "wallpaper.png" {} ''
      cp ${../../home-manager/modules/i3/wallpaper.png} $out
    '';
    greeters.gtk = {
      enable = true;
      theme = {
        name = "Catppuccin-Mocha-Standard-Blue-Dark";
        package = pkgs.catppuccin-gtk;
      };
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
      cursorTheme = {
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
        size = 24;
      };
      clock-format = "%H:%M";
      indicators = [
        "~host"
        "~spacer"
        "~clock"
        "~session"
        "~power"
      ];
    };
  };
  # --- 5. SOUND ---
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  # Cài đặt các gói cần thiết cho i3
  services.xserver.windowManager.i3.package = pkgs.i3-gaps; # Dùng i3-gaps cho đẹp
  services.xserver.windowManager.i3.extraPackages = with pkgs; [
    i3status # Thanh trạng thái
    i3lock # Khóa màn hình
    dmenu # Trình chạy ứng dụng cơ bản
  ];

  # --- 5. TẠO NGƯỜI DÙNG ---
  users.users.${user} = {
    isNormalUser = true;
    description = "Quang";
    extraGroups = ["networkmanager" "wheel"]; # "wheel" cho phép dùng lệnh sudo
    shell = "/home/${user}/.nix-profile/bin/zsh";
  };
  # --- 6. CÁC GÓI PHẦN MỀM CÀI ĐẶT TRÊN TOÀN HỆ THỐNG ---
  environment.systemPackages = with pkgs; [
    home-manager
    vim
  ];
  # --- 6.5. Virtual machine ---
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = ["quang"];
  virtualisation.virtualbox.host.enableExtensionPack = true;
  # --- 8. CÁC DỊCH VỤ KHÁC ---
  services.openssh.enable = true; # Bật SSH để có thể truy cập từ xa
  programs.dconf.enable = true;
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = ["flakes" "nix-command"];
  };

  system.stateVersion = "${hostMain.stateVersion}"; # Hoặc phiên bản tương ứng
  # system.stateVersion = "25.05"; # Hoặc phiên bản tương ứng
}
