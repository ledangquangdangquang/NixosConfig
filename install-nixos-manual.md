# 📘 Hướng Dẫn Cài Đặt NixOS Toàn Tập (UEFI + VirtualBox)

Cài đặt **NixOS** chưa bao giờ dễ đến thế! Tài liệu này hướng dẫn bạn từng bước thiết lập NixOS trên máy ảo **VirtualBox**, **chuẩn UEFI**, từ phân vùng đĩa đến cấu hình đồ họa với i3.

---

## 🧰 Giai Đoạn 0: Chuẩn Bị

### ✅ Tải về NixOS ISO

* Truy cập [https://nixos.org/download.html](https://nixos.org/download.html)
* Chọn **Minimal ISO** (Chuẩn UEFI)

### ✅ Tạo máy ảo VirtualBox

* Tạo máy ảo mới với cấu hình:

  * **Loại**: Linux
  * **Phiên bản**: Other Linux (64-bit)
  * **Dung lượng RAM**: ≥ 2048 MB
  * **Ổ đĩa**: ≥ 10 GB

* Cấu hình UEFI (**BẮT BUỘC**):

  * `Settings → System → Motherboard → Enable EFI (special OSes only)` ✔️

* Gắn file `.iso` vào ổ đĩa ảo.

---

## 🚀 Giai Đoạn 1: Khởi Động và Phân Vùng

Khởi động vào ISO và vào terminal:

```sh
sudo -i  # chuyển sang root
```

### 🧱 Phân vùng với `parted`:

```sh
parted /dev/sda -- mklabel gpt
parted /dev/sda -- mkpart ESP fat32 1MiB 513MiB
parted /dev/sda -- set 1 esp on
parted /dev/sda -- mkpart primary ext4 513MiB 100%
```

### 🔍 Kiểm tra:

```sh
lsblk
```

Kết quả: `/dev/sda1` (EFI), `/dev/sda2` (Root)

---

## 💾 Giai Đoạn 2: Định Dạng và Gắn Kết

### 🔧 Định dạng:

```sh
mkfs.fat -F 32 -n boot /dev/sda1
mkfs.ext4 -L nixos /dev/sda2
```

### 📂 Gắn phân vùng:

```sh
mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
mount /dev/disk/by-label/boot /mnt/boot
```

---

## ⚙️ Giai Đoạn 3: Cấu Hình NixOS

### ✅ Tạo tệp cấu hình ban đầu:

```sh
nixos-generate-config --root /mnt
```

### ✏️ Cập nhật `configuration.nix`

#### ✅ Cách 1 (Dễ nhất - Dùng file có sẵn):

```sh
curl -L -o /mnt/etc/nixos/configuration.nix https://github.com/ledangquangdangquang/NixosConfig/releases/download/v0.0.0/configuration.nix
```

#### ⚙️ Cách 2 (Tự chỉnh sửa):

```sh
nano /mnt/etc/nixos/configuration.nix
```

📄 **Xem mẫu cấu hình đầy đủ**: [Tại đây](#c%E1%BA%A5u-h%C3%ACnh-m%E1%BA%ABu)

---

## 💽 Giai Đoạn 4: Cài Đặt và Khởi Động

### ⏳ Cài đặt:

```sh
nixos-install
```

👉 Đặt mật khẩu cho tài khoản `root` khi được yêu cầu.

### 🔁 Khởi động lại:

```sh
reboot
```

💡 **Lưu ý**: Ngay khi máy ảo khởi động lại, **gỡ file ISO** khỏi ổ đĩa ảo!

---

## 🔐 Giai Đoạn 5: Đăng Nhập Người Dùng

### ❗ Vấn đề thường gặp

Bạn chưa thể đăng nhập vì tài khoản `quang` **chưa có mật khẩu**.

### 💡 Giải pháp:

1. Vào TTY:

   ```
   Ctrl + Alt + F2
   ```

2. Đăng nhập root:

   ```
   login: root
   ```

3. Đặt mật khẩu:

   ```sh
   passwd quang
   ```

4. Quay lại màn hình đăng nhập: `Ctrl + Alt + F1`

5. Đăng nhập với:

   * **Username**: `quang`
   * **Password**: mật khẩu bạn vừa đặt

---

## 🔄 Cập nhật hệ thống sau này

Bất cứ khi nào thay đổi `configuration.nix`, hãy chạy:

```sh
sudo nixos-rebuild switch
```

---

## 📄 Cấu Hình Mẫu

<details>
<summary>Nhấn để xem cấu hình mẫu <code>configuration.nix</code></summary>

```nix
# /mnt/etc/nixos/configuration.nix
{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Ho_Chi_Minh";

  i18n.supportedLocales = [ "en_US.UTF-8/UTF-8" "vi_VN.UTF-8/UTF-8" ];
  i18n.defaultLocale = "vi_VN.UTF-8";

  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.xserver.windowManager.i3.package = pkgs.i3-gaps;
  services.xserver.windowManager.i3.extraPackages = with pkgs; [
    i3status i3lock dmenu
  ];

  users.users.quang = {
    isNormalUser = true;
    description = "Quang";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    git wget firefox alacritty rofi feh
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
  ];

  services.openssh.enable = true;
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.05";
}
```

</details>

---

## 🎉 Kết Luận

Bạn đã hoàn tất quá trình cài đặt NixOS chuẩn UEFI!
Hãy khám phá sự linh hoạt và mạnh mẽ của Nix.

---

## 📎 Tham khảo

* [NixOS Official Docs](https://nixos.org/learn.html)
* [NixOS Wiki](https://nixos.wiki)

---

✍️ *Tài liệu bởi [ledangquangdangquang](https://github.com/ledangquangdangquang)*
📅 Phiên bản: `2024-08`


