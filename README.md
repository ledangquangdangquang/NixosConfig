# 🧨 NixOS Setup & Workflow Guide

## 📦 Add Home Manager Channel

```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-channel --list
```

---

## 🚀 Build System with Flake

```bash
sudo nixos-rebuild switch --flake ./
home-manager switch --flake ./
```

---

## 🔍 Kiểm tra option có tồn tại không (ví dụ với Git)

```bash
nixos-option programs.git
```

---

## 🛠️ Workflow cấu hình

### 1. Với `home-manager`

* Nếu gói ứng dụng nằm trong `programs`, thì:

  * Kích hoạt bằng `enable = true` trong `{app}.nix`
  * Thêm `imports = [ ./modules/{app}.nix ];` vào `home.nix`
* Nếu không có trong `programs`, thì:

  * Thêm vào `home-package.nix` để cài từ `nixpkgs`

---

## 🧹 Lỗi không nhận font

```bash
fc-cache -fv  # Làm mới font cache
```

---

## 🧽 Tmux Keybindings

### 🔹 **1. Phím tắt mặc định trong tmux**

> **Prefix mặc định**: `Ctrl + b`

| Phím tắt                    | Chức năng                     |
| --------------------------- | ----------------------------- |
| `Ctrl + b` rồi `c`          | Tạo cửa sổ mới                |
| `Ctrl + b` rồi `n`          | Chuyển đến cửa sổ tiếp theo   |
| `Ctrl + b` rồi `p`          | Quay lại cửa sổ trước         |
| `Ctrl + b` rồi `0` → `9`    | Chuyển đến cửa sổ số 0 → 9    |
| `Ctrl + b` rồi `"`          | Chia pane theo chiều ngang    |
| `Ctrl + b` rồi `%`          | Chia pane theo chiều dọc      |
| `Ctrl + b` rồi `x`          | Đóng pane hiện tại            |
| `Ctrl + b` rồi `o`          | Di chuyển qua các pane        |
| `Ctrl + b` rồi `{` hoặc `}` | Di chuyển pane sang trái/phải |
| `Ctrl + b` rồi `d`          | Tách khỏi tmux (detach)       |
| `tmux attach`               | Kết nối lại vào tmux session  |
| `Ctrl + b` rồi `,`          | Đổi tên cửa sổ                |
| `Ctrl + b` rồi `:`          | Mở command prompt             |

---

### 📁 Cửa sổ (Window) tùy chỉnh theo config cá nhân

| Phím                  | Chức năng                   |
| --------------------- | --------------------------- |
| `Alt + r`             | Tải lại tmux config         |
| `Ctrl + p / Ctrl + n` | Qua lại giữa các cửa sổ     |
| `Alt + 1` → `Alt + 9` | Chuyển đến cửa sổ tương ứng |
| `Alt + Enter`         | Mở cửa sổ mới               |
| `Alt + o`             | Mở `nvim` với file todo     |
| `Alt + f`             | Mở `nvim` với flake.nix     |
| `Alt + n`             | Mở `nvim` cấu hình          |
| `Alt + q`             | Đóng cửa sổ                 |
| `Alt + Q`             | Thoát toàn bộ tmux session  |

---

### 🪡 Pane (cửa sổ con)

| Phím                    | Chức năng                   |
| ----------------------- | --------------------------- |
| `Alt + s`               | Chia ngang (theo chiều dọc) |
| `Alt + v`               | Chia dọc (theo chiều ngang) |
| `Alt + mũi tên`         | Di chuyển giữa các pane     |
| `Alt + Shift + mũi tên` | Thay đổi kích thước pane    |
| `Alt + c`               | Đóng pane hiện tại          |

---

## 💾 Git & GitHub Workflow

### Ạnh xạ: Khởi tạo project và commit đầu tiên

```bash
mkdir my-project
cd my-project
git init
echo "# My Project" > README.md
git add .
git commit -m "Initial commit"
```

### Ạnh xạ: Tạo repo trên GitHub và kết nối

```bash
git remote add origin git@github.com:your-username/my-project.git
git branch -M main
git push -u origin main
```

### 🔐 Tạo SSH key để push lên GitHub

```bash
ssh-keygen -t ed25519 -C "your-email@example.com"
```

* Nhấn Enter để chấp nhận đường dẫn mặc định (`~/.ssh/id_ed25519`)
* Sau khi tạo xong, thêm key vào ssh-agent:

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

* Copy public key:

```bash
cat ~/.ssh/id_ed25519.pub
```

* Và dán vào trang GitHub > Settings > SSH and GPG keys > New SSH key

---

> ✅ Đã hoàn tất các bước cấu hình cơ bản cho NixOS, Home Manager, tmux và Git. Hãy commit lại file README.md này để lưu lại quy trình!
