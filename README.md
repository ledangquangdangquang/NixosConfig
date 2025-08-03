# 🚀 Cài đặt NixOS từ Flake Repo

Repo này chứa cấu hình NixOS + Home Manager dưới dạng flake.
Có thể dùng để cài nhanh một hệ thống mới từ ISO NixOS (TTY only).

## 1. Kết nối mạng

```bash
ping -c3 google.com
```

* Nếu WiFi:

```bash
nmtui
```

---

## 2. Chia phân vùng ổ đĩa (ví dụ `/dev/sda`)

```bash
parted /dev/sda -- mklabel gpt
parted /dev/sda -- mkpart ESP fat32 1MiB 513MiB
parted /dev/sda -- set 1 esp on
parted /dev/sda -- mkpart primary ext4 513MiB 100%
```

---

## 3. Định dạng phân vùng

```bash
mkfs.vfat -F32 /dev/sda1   # EFI
mkfs.ext4 /dev/sda2        # Root
```

---

## 4. Mount phân vùng

```bash
mount /dev/sda2 /mnt
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot
```

---

## 5. Cài Git (nếu ISO chưa có)

```bash
nix-shell -p git
```

---

## 6. Clone repo cấu hình

```bash
git clone https://github.com/ledangquangdangquang/NixosConfig.git /mnt/root/nixos-config
cd /mnt/root/nixos-config
```

> Nếu bạn muốn dùng SSH thay vì HTTPS thì thay URL bằng `git@github.com:ledangquangdangquang/NixosConfig.git`.

---

## 7. Cài đặt NixOS bằng flake

* Nếu cài trên máy thật:

```bash
nixos-install --flake .#nixos
```

* Nếu cài trên máy ảo:

```bash
nixos-install --flake .#nixos-vm
```

Đặt mật khẩu cho root khi được hỏi.

---

## 8. Reboot

```bash
reboot
```

---

## 9. Sau khi đăng nhập với user đã định nghĩa trong flake

```bash
cd ~/nixos-config
home-manager switch --flake .#<username>
```

* `<username>` = user được định nghĩa trong `home-manager/home.nix` (máy thật) hoặc `home-manager/home-vm.nix` (máy ảo).

---

## 🔁 Cập nhật hệ thống về sau

```bash
cd ~/nixos-config
sudo nixos-rebuild switch --flake .#<host>
home-manager switch --flake .#<username>
```

* `<host>` = `nixos` hoặc `nixos-vm`
* `<username>` = user bạn đã định nghĩa trong Home Manager

