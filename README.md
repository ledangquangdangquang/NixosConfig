<h1 align="center"> My dotfile Nixos</h1>

---
## INSTALL
> [!NOTE]
> Before install add features `flake` and `nix-command` in your `/etc/nixos/configuration.nix`
> ```
> nix.settings.experimental-features = ["flake" "nix-command"];
> ```
* Clone my repo.
    ```
    cd ~
    git clone https://github.com/ledangquangdangquang/NixosConfig.git
    ```
* Install flake 
    ```
    sudo nixos-rebuild switch --flake ./#nixos 
    ```
    if your host is **virtual machine**
    ```
    sudo nixos-rebuild switch --flake ./#nixos-vm
    ```
* Install home-manager 
    ```
    home-manager switch --flake ./#quang@nixos
    ```
    if your host is **virtual machine**
    ```
    home-manager switch --flake ./#quang@nixos-vm

    ```

## Keyshortcuts
| Key | Description |
|--------------- | --------------- |
| `Super + Enter`| Open alacrrity|
| `Super + D`   | Open rofi|
| `Super + F`   | Open firefox|
| `Super + Shift + e`| Exit i3   |
| `Super + H/J/K/L`| Move with app|
| `Super + R` then `H/J/K/L`| Resize mode|
| `Super + Shift + F`| Fullcreen app|
| `Super + Shift + Space`| Float app|
| `Super + 1/2/3/4`| Move with workspace|
| `Super + Q`| Quit the app|
| `F8`| Screenshot|
| `F9`| volume down|
| `F10`| volume up|
| `F11`| mute volume|
| `F12`| unmute volume|

> [!NOTE]
> * See all keyshortcuts in `~/NixosConfig/home-manager/modules/i3/config` 
> * See all keyshortcuts **tmux** in `~/NixosConfig/home-manager/modules/tmux.nix`
