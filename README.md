<h1 align="center"> My dotfile Nixos</h1>

---
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
<style type="text/css">
.tg  {border-collapse:collapse;border-color:#9ABAD9;border-spacing:0;}
.tg td{background-color:#EBF5FF;border-color:#9ABAD9;border-style:solid;border-width:1px;color:#444;
  font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{background-color:#409cff;border-color:#9ABAD9;border-style:solid;border-width:1px;color:#fff;
  font-family:Arial, sans-serif;font-size:14px;font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-lboi{border-color:inherit;text-align:left;vertical-align:middle}
.tg .tg-7btt{border-color:inherit;font-weight:bold;text-align:center;vertical-align:top}
.tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
</style>
<table class="tg"><thead>
  <tr>
    <th class="tg-7btt" colspan="2">I3</th>
    <th class="tg-7btt" colspan="2">Tmux</th>
  </tr></thead>
<tbody>
  <tr>
    <td class="tg-0pky">Key</td>
    <td class="tg-0pky">Description</td>
    <td class="tg-0pky">Key</td>
    <td class="tg-0pky">Description</td>
  </tr>
  <tr>
    <td class="tg-0pky">`Mod+Enter`</td>
    <td class="tg-0pky">Launch terminal (Alacritty)</td>
    <td class="tg-lboi">`Alt+r`</td>
    <td class="tg-lboi">Reload tmux configuration file</td>
  </tr>
  <tr>
    <td class="tg-0pky">`Mod+f`</td>
    <td class="tg-0pky">Launch Firefox</td>
    <td class="tg-lboi">`Alt+1` → `Alt+9`</td>
    <td class="tg-lboi">Quickly switch to window 1 → 9</td>
  </tr>
  <tr>
    <td class="tg-0pky">`Mod+q`</td>
    <td class="tg-0pky">Close focused window</td>
    <td class="tg-lboi">`Alt+h` / `Alt+l` / `Alt+k` / `Alt+j`</td>
    <td class="tg-lboi">Move focus to pane left / right / up / down</td>
  </tr>
  <tr>
    <td class="tg-0pky">`Mod+d`</td>
    <td class="tg-0pky">Launch application menu (Rofi)</td>
    <td class="tg-lboi">`Alt+←` / `Alt+→` / `Alt+↑` / `Alt+↓`</td>
    <td class="tg-lboi">Resize pane (left/right ±5, up/down ±3)</td>
  </tr>
  <tr>
    <td class="tg-0pky">`F8`</td>
    <td class="tg-0pky">Take a screenshot and save to<br> `~/Pictures/Screenshots/screenshot.png`</td>
    <td class="tg-lboi">`Alt+s`</td>
    <td class="tg-lboi">Split pane horizontally</td>
  </tr>
  <tr>
    <td class="tg-0pky">`F10` / `F9`</td>
    <td class="tg-0pky">Increase / decrease volume (+/-10%)</td>
    <td class="tg-lboi">`Alt+v`</td>
    <td class="tg-lboi">Split pane vertically</td>
  </tr>
  <tr>
    <td class="tg-0pky">`F12` / `F11`</td>
    <td class="tg-0pky">Unmute / mute audio</td>
    <td class="tg-lboi">`Alt+o`</td>
    <td class="tg-lboi">Open Neovim with Telescope file search</td>
  </tr>
  <tr>
    <td class="tg-0pky">`Mod+h` / `Mod+j` /<br> `Mod+k` / `Mod+l`</td>
    <td class="tg-0pky">Move focus left / down / up / right</td>
    <td class="tg-lboi">`Alt+Shift+O`</td>
    <td class="tg-lboi">Open Neovim with fuzzyvim file search (fzf preview)</td>
  </tr>
  <tr>
    <td class="tg-0pky">`Mod+←` / `Mod+↓` / <br>`Mod+↑` / `Mod+→`</td>
    <td class="tg-0pky">Move focus using arrow keys</td>
    <td class="tg-lboi">`Alt+n`</td>
    <td class="tg-lboi">Create a new window</td>
  </tr>
  <tr>
    <td class="tg-0pky">`Mod+Shift+h/j/k/l`</td>
    <td class="tg-0pky">Move focused window left / down / up / right</td>
    <td class="tg-0pky"></td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">`Mod+b` / `Mod+v`</td>
    <td class="tg-0pky">Split container horizontally / vertically</td>
    <td class="tg-0pky"></td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">`Mod+Shift+f`</td>
    <td class="tg-0pky">Toggle fullscreen</td>
    <td class="tg-0pky"></td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">`Mod+s` / `Mod+w` / `Mod+e`</td>
    <td class="tg-0pky">Switch layout: stacking / tabbed / toggle split</td>
    <td class="tg-0pky"></td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">`Mod+Shift+space`</td>
    <td class="tg-0pky">Toggle floating mode for focused window</td>
    <td class="tg-0pky"></td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">`Mod+space`</td>
    <td class="tg-0pky">Toggle focus mode (tiling / floating)</td>
    <td class="tg-0pky"></td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">`Mod+a`</td>
    <td class="tg-0pky">Focus parent container</td>
    <td class="tg-0pky"></td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">`Mod+1` → `Mod+0`</td>
    <td class="tg-0pky">Switch to workspace 1 → 10</td>
    <td class="tg-0pky"></td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">`Mod+Shift+1` → `Mod+Shift+0`</td>
    <td class="tg-0pky">Move container to workspace 1 → 10</td>
    <td class="tg-0pky"></td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">`Mod+Shift+c`</td>
    <td class="tg-0pky">Reload i3 configuration</td>
    <td class="tg-0pky"></td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">`Mod+Shift+r`</td>
    <td class="tg-0pky">Restart i3</td>
    <td class="tg-0pky"></td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">`Mod+Shift+e`</td>
    <td class="tg-0pky">Exit i3 session</td>
    <td class="tg-0pky"></td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">`Mod+r`</td>
    <td class="tg-0pky">Enter resize mode</td>
    <td class="tg-0pky"></td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">In resize mode: <br>`h/j/k/l` or `←/↓/↑/→`</td>
    <td class="tg-0pky">Resize window</td>
    <td class="tg-0pky"></td>
    <td class="tg-0pky"></td>
  </tr>
  <tr>
    <td class="tg-0pky">`Return` / `Escape` / `Mod+r`</td>
    <td class="tg-0pky">Exit resize mode</td>
    <td class="tg-0pky"></td>
    <td class="tg-0pky"></td>
  </tr>
</tbody></table>

> [!NOTE]
> * See all keyshortcuts in `~/NixosConfig/home-manager/modules/i3/config` 
> * See all keyshortcuts **tmux** in `~/NixosConfig/home-manager/modules/tmux.nix`
