{
  services.picom = {
    enable = true;
    backend = "xrender"; # hoặc "xrender" nếu máy ảo không hỗ trợ GLX
    vSync = true;
    shadow = true;

    settings = {
      corner-radius = 15;
      rounded-corners-exclude = [
        "class_g = 'i3-frame'"
        "window_type = 'dock'"
        "window_type = 'desktop'"
      ];
    };
  };
}
