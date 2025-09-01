{ config, pkgs, ... }: {
  # Cài đặt Node.js và npm
  programs.nodejs = {
    enable = true;
    package = pkgs.nodejs-18_x;  # Hoặc bạn có thể chọn phiên bản khác
  };

  # Nếu bạn cần thêm pnpm (một package manager khác cho Node.js)
  # programs.pnpm = {
  #   enable = true;
  # };

}
