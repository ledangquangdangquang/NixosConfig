{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  # --- 1. BOOTLOADER (Bắt buộc cho hệ thống EFI) ---
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # --- 2. MẠNG ---
  networking.hostName = "nixos-vm"; # Tên máy tính của bạn
  networking.networkmanager.enable = true;  # Dùng NetworkManager để quản lý WiFi, Ethernet dễ dàng.

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


  # --- 4. MÔI TRƯỜNG ĐỒ HỌA (i3 Window Manager) ---
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true; # Màn hình đăng nhập
  services.xserver.windowManager.i3.enable = true;      # Trình quản lý cửa sổ i3
  
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
    i3status  # Thanh trạng thái
    i3lock    # Khóa màn hình
    dmenu     # Trình chạy ứng dụng cơ bản
  ];


  # --- 5. TẠO NGƯỜI DÙNG ---
  users.users.quang = {
    isNormalUser = true;
    description = "Quang";
    extraGroups = [ "networkmanager" "wheel" ]; # "wheel" cho phép dùng lệnh sudo
    shell = "/home/quang/.nix-profile/bin/zsh";
  };
  # --- 6. CÁC GÓI PHẦN MỀM CÀI ĐẶT TRÊN TOÀN HỆ THỐNG ---
  environment.systemPackages = with pkgs; [
    home-manager 
    vim
  ];
  

  # --- 8. CÁC DỊCH VỤ KHÁC ---
  services.openssh.enable = true; # Bật SSH để có thể truy cập từ xa
  programs.dconf.enable = true;
  # Cho phép cài đặt các phần mềm không tự do (non-free) như Discord, Steam...
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
		experimental-features = [ "flakes"  "nix-command"];
	};
  # Dòng này là bắt buộc. Hãy giữ nguyên phiên bản NixOS bạn đang cài.
  system.stateVersion = "25.05"; # Hoặc phiên bản tương ứng
}
