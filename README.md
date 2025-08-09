<h1 align="center"> My dotfiles Nixos</h1>

<div align="center">

![nixos](https://img.shields.io/badge/NixOS-22.05-24273A.svg?logo=nixos&logoColor=CAD3F5&colorA=24273A&colorB=8aadf4)
![nixpkgs](https://img.shields.io/badge/nixpkgs-unstable-informational.svg?style=flat&logo=nixos&logoColor=CAD3F5&colorA=24273A&colorB=8aadf4)
![Home Manager](https://img.shields.io/badge/Home%20Manager-master-blue?logo=nixos&logoColor=CAD3F5&colorA=24273A&colorB=8aadf4)
![i3 Window Manager](https://img.shields.io/badge/i3-4.24-blue?logo=i3&logoColor=CAD3F5&colorA=24273A&colorB=8aadf4)

</div>

## SHOWCASE
![zathura](./assets/zathura.png) 
![btop yazi and neofetch](./assets/btop-yazi-neofetch.png) 
## INSTALL
Before install enter the **tty** (`Ctrl+Shift+F2`) to begin.
> [!NOTE]
> * Nixos version 25.05
> * Before install add features `flake` and `nix-command` in your `/etc/nixos/configuration.nix`
>   ```
>   nix.settings.experimental-features = ["flake" "nix-command"];
>   ```
* ***Clone my repo***
    ```
    nix-shell -p git
    cd ~
    git clone https://github.com/ledangquangdangquang/NixosConfig.git
    cd NixosConfig
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
<table><thead><tr><th colspan="2">I3(Mod=Super)</th><th colspan="2">Tmux</th></tr></thead><tbody><tr><td align="center"><strong>Key</strong></td><td align="center"><strong>Description</strong></td><td align="center"><strong>Key</strong></td><td align="center"><strong>Description</strong></td></tr><tr><td><code>Mod+Enter</code></td><td>Launch terminal(Alacritty)</td><td><code>Alt+r</code></td><td>Reload tmux configuration file</td></tr><tr><td><code>Mod+f</code></td><td>Launch Firefox</td><td><code>Alt+1</code>&rarr;<code>Alt+9</code></td><td>Quickly switch to window 1&rarr;9</td></tr><tr><td><code>Mod+q</code></td><td>Close focused window</td><td><code>Alt+h</code>/<code>Alt+l</code>/<code>Alt+k</code>/<code>Alt+j</code></td><td>Move focus to pane left/right/up/down</td></tr><tr><td><code>Mod+d</code></td><td>Launch application menu(Rofi)</td><td><code>Alt+&larr;</code>/<code>Alt+&rarr;</code>/<code>Alt+&uarr;</code>/<code>Alt+&darr;</code></td><td>Resize pane(left/right&plusmn;5,up/down&plusmn;3)</td></tr><tr><td><code>F8</code></td><td>Take a screenshot and save to<code>~/Pictures/Screenshots/screenshot.png</code></td><td><code>Alt+s</code></td><td>Split pane horizontally</td></tr><tr><td><code>F10</code>/<code>F9</code></td><td>Increase/decrease volume(+/-10%)</td><td><code>Alt+v</code></td><td>Split pane vertically</td></tr><tr><td><code>F12</code>/<code>F11</code></td><td>Unmute/mute audio</td><td><code>Alt+o</code></td><td>Open Neovim with Telescope file search</td></tr><tr><td><code>Mod+h</code>/<code>Mod+j</code>/<code>Mod+k</code>/<code>Mod+l</code></td><td>Move focus left/down/up/right</td><td><code>Alt+Shift+O</code></td><td>Open Neovim with fuzzyvim file search(fzf preview)</td></tr><tr><td><code>Mod+&larr;</code>/<code>Mod+&darr;</code>/<code>Mod+&uarr;</code>/<code>Mod+&rarr;</code></td><td>Move focus using arrow keys</td><td><code>Alt+n</code></td><td>Create a new window</td></tr><tr><td><code>Mod+Shift+h/j/k/l</code></td><td>Move focused window left/down/up/right</td></tr><tr><td><code>Mod+b</code>/<code>Mod+v</code></td><td>Split container horizontally/vertically</td></tr><tr><td><code>Mod+Shift+f</code></td><td>Toggle fullscreen</td></tr><tr><td><code>Mod+s</code>/<code>Mod+w</code>/<code>Mod+e</code></td><td>Switch layout:stacking/tabbed/toggle split</td></tr><tr><td><code>Mod+Shift+space</code></td><td>Toggle floating mode for focused window</td></tr><tr><td><code>Mod+space</code></td><td>Toggle focus mode(tiling/floating)</td></tr><tr><td><code>Mod+a</code></td><td>Focus parent container</td></tr><tr><td><code>Mod+1</code>&rarr;<code>Mod+0</code></td><td>Switch to workspace 1&rarr;10</td></tr><tr><td><code>Mod+Shift+1</code>&rarr;<code>Mod+Shift+0</code></td><td>Move container to workspace 1&rarr;10</td></tr><tr><td><code>Mod+Shift+c</code></td><td>Reload i3 configuration</td></tr><tr><td><code>Mod+Shift+r</code></td><td>Restart i3</td></tr><tr><td><code>Mod+Shift+e</code></td><td>Exit i3 session</td></tr><tr><td><code>Mod+r</code></td><td>Enter resize mode</td></tr><tr><td>In resize mode:<code>h/j/k/l</code>or<code>&larr;/&darr;/&uarr;/&rarr;</code></td><td>Resize window</td></tr><tr><td><code>Return</code>/<code>Escape</code>/<code>Mod+r</code></td><td>Exit resize mode</td></tr></tbody></table>

> [!NOTE]
> * See all keyshortcuts in `~/NixosConfig/home-manager/modules/i3/config` 
> * See all keyshortcuts **tmux** in `~/NixosConfig/home-manager/modules/tmux.nix`
