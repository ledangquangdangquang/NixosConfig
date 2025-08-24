{
  services.picom = {
    enable = true;
    backend = "glx"; # dùng GLX để hỗ trợ blur; nếu máy bạn không hỗ trợ thì quay lại "xrender"
    vSync = true;
    shadow = true;

    settings = {
      corner-radius = 15;

      # Bo góc chỉ áp dụng cho cửa sổ không nằm trong danh sách này
      rounded-corners-exclude = [
        "class_g = 'i3-frame'"
        "window_type = 'dock'"
        "window_type = 'desktop'"
      ];

      # Làm trong suốt Kitty
      opacity-rule = [
        #  xprop | grep WM_CLASS
        "90:class_g = 'kitty'"
        "90:class_g = 'Alacritty'"
        "90:class_g = 'firefox'"
        "90:class_g = 'Rofi'"
        "90:class_g = 'Zathura'"
        "90:class_g = 'obsidian'"
        "90:class_g = 'Thunar'"
        "90:class_g = 'Code'"
      ];

      # Thêm hiệu ứng blur cho cửa sổ
      blur = {
        method = "dual_kawase";
        strength = 7;
        background = false;
      };

      # Cho phép blur trên một số loại cửa sổ
      wintypes = {
        normal = { blur = true; };
        dialog = { blur = true; };
        tooltip = { blur = true; };
        popup_menu = { blur = true; };
        dropdown_menu = { blur = true; };
      };

      # Bo góc chỉ cho Kitty (tùy chọn nếu muốn áp riêng)
      round-borders = 1;
      round-borders-rule = [ "class_g = 'kitty'" ];
    };
  };
}

