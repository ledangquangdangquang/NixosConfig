<h1 align="center"> My dotfile Nixos</h1>

---
## INSTALL
> [!NOTE]
> * Nixos version 25.05
> * Before install add features `flake` and `nix-command` in your `/etc/nixos/configuration.nix`
>   ```
>   nix.settings.experimental-features = ["flake" "nix-command"];
>   ```
* ***Clone my repo***
    ```
    cd ~
    git clone https://github.com/ledangquangdangquang/NixosConfig.git
    ```
* ***Replace `hardware-configuration.nix`***
    ```
    cp /etc/nixos/hardware-configuration.nix ~/NixosConfig/hosts/nixos/hardware-configuration.nix
    ```
    If your host is **virtual machine**
    ```
    cp /etc/nixos/hardware-configuration.nix ~/NixosConfig/hosts/nixos-vm/hardware-configuration.nix
    ```
* ***Install flake***
    ```
    sudo nixos-rebuild switch --flake ./#nixos 
    ```
    If your host is **virtual machine**
    ```
    sudo nixos-rebuild switch --flake ./#nixos-vm
    ```
* ***Install home-manager***
    ```
    home-manager switch --flake ./#quang@nixos
    ```
    If your host is **virtual machine**
    ```
    home-manager switch --flake ./#quang@nixos-vm
    ```

## KEYSHORTCUTS
### i3 (Mod key = SUPER key)
| Key                                             | Description                                                           |
| ----------------------------------------------- | --------------------------------------------------------------------- |
| `Mod+Enter`                                     | Launch terminal (Alacritty)                                           |
| `Mod+f`                                         | Launch Firefox                                                        |
| `Mod+q`                                         | Close focused window                                                  |
| `Mod+d`                                         | Launch application menu (Rofi)                                        |
| `F8`                                            | Take a screenshot and save to `~/Pictures/Screenshots/screenshot.png` |
| `F10` / `F9`                                    | Increase / decrease volume (+/-10%)                                   |
| `F12` / `F11`                                   | Unmute / mute audio                                                   |
| `Mod+h` / `Mod+j` / `Mod+k` / `Mod+l`           | Move focus left / down / up / right                                   |
| `Mod+←` / `Mod+↓` / `Mod+↑` / `Mod+→`           | Move focus using arrow keys                                           |
| `Mod+Shift+h/j/k/l`                             | Move focused window left / down / up / right                          |
| `Mod+b` / `Mod+v`                               | Split container horizontally / vertically                             |
| `Mod+Shift+f`                                   | Toggle fullscreen                                                     |
| `Mod+s` / `Mod+w` / `Mod+e`                     | Switch layout: stacking / tabbed / toggle split                       |
| `Mod+Shift+space`                               | Toggle floating mode for focused window                               |
| `Mod+space`                                     | Toggle focus mode (tiling / floating)                                 |
| `Mod+a`                                         | Focus parent container                                                |
| `Mod+1` → `Mod+0`                               | Switch to workspace 1 → 10                                            |
| `Mod+Shift+1` → `Mod+Shift+0`                   | Move container to workspace 1 → 10                                    |
| `Mod+Shift+c`                                   | Reload i3 configuration                                               |
| `Mod+Shift+r`                                   | Restart i3                                                            |
| `Mod+Shift+e`                                   | Exit i3 session                                                       |
| `Mod+r`                                         | Enter resize mode                                                     |
| In resize mode: `h/j/k/l` or `←/↓/↑/→`          | Resize window                                                         |
| `Return` / `Escape` / `Mod+r`                   | Exit resize mode                                                      |

### Tmux
| Key                                   | Description                                         |
| ------------------------------------- | --------------------------------------------------- |
| `Alt+r`                               | Reload tmux configuration file                      |
| `Alt+1` → `Alt+9`                     | Quickly switch to window 1 → 9                      |
| `Alt+h` / `Alt+l` / `Alt+k` / `Alt+j` | Move focus to pane left / right / up / down         |
| `Alt+←` / `Alt+→` / `Alt+↑` / `Alt+↓` | Resize pane (left/right ±5, up/down ±3)             |
| `Alt+s`                               | Split pane horizontally                             |
| `Alt+v`                               | Split pane vertically                               |
| `Alt+o`                               | Open Neovim with Telescope file search              |
| `Alt+Shift+O`                         | Open Neovim with fuzzyvim file search (fzf preview) |
| `Alt+n`                               | Create a new window                                 |

> [!NOTE]
> * See all keyshortcuts in `~/NixosConfig/home-manager/modules/i3/config` 
> * See all keyshortcuts **tmux** in `~/NixosConfig/home-manager/modules/tmux.nix`
