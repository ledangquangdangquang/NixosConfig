{pkgs, ...}:{
  home.packages = with pkgs; [
    bluez          # Bluetooth stack
    blueman        # GUI quản lý Bluetooth
    pulseaudio     # nếu dùng sound
  ];

}
