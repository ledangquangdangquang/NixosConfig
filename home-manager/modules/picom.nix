{
  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;
    shadow = true;

    settings = {
      corner-radius = 15;

      # Bo góc cho cửa sổ
      rounded-corners-exclude = [
        "class_g = 'i3-frame'"
        "window_type = 'dock'"
        "window_type = 'desktop'"
      ];

      # Trong suốt
      opacity-rule = [
        "70:class_g = 'kitty'"
        "90:class_g = 'Alacritty'"
        "90:class_g = 'firefox'"
        "90:class_g = 'Rofi'"
        "90:class_g = 'Zathura'"
        "90:class_g = 'obsidian'"
        "90:class_g = 'Thunar'"
        "90:class_g = 'Code'"
      ];

      # Blur
      blur = {
        method = "dual_kawase";
        strength = 7;
        background = false;
      };

      wintypes = {
        normal = { blur = true; };
        dialog = { blur = true; };
        tooltip = { blur = true; };
        popup_menu = { blur = true; };
        dropdown_menu = { blur = true; };
      };

      # Fade (chuyển cảnh mượt)
      fading = true;
      fade-in-step = 0.04;
      fade-out-step = 0.04;
      fade-delta = 5;
      fade-exclude = [ ]; # Nếu muốn loại trừ cửa sổ không fade

      # (Tùy chọn) bo góc riêng Kitty
      round-borders = 1;
      round-borders-rule = [ "class_g = 'kitty'" ];
    };
  };
}
