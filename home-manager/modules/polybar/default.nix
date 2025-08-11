{ config, pkgs, ... }: {
  home.file.".config/polybar/config.ini" = {
    source = ./config.ini;
  };

  home.file.".config/polybar/scripts/wifi_menu.sh" = {
    source = ./scripts/wifi_menu.sh;
    executable = true;  # Cấp quyền chạy cho script
  };
  home.file.".config/polybar/scripts/bluetooth_toggle.sh" = {
    source = ./scripts/bluetooth_toggle.sh;
    executable = true;  # Cấp quyền chạy cho script
  };
}
