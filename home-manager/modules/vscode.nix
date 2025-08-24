{pkgs, ...}: {
  programs.vscode.enable = true;
  programs.vscode.profiles.default = {
    extensions = with pkgs.vscode-extensions; [
      ms-python.python
      platformio.platformio-vscode-ide
      eamodio.gitlens
      esbenp.prettier-vscode
      catppuccin.catppuccin-vsc-icons
      catppuccin.catppuccin-vsc
    ];
    userSettings = {
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.iconTheme" = "catppuccin-mocha";
      "editor.fontSize" = 16;
      "editor.tabSize" = 2;
      "files.autoSave" = "onFocusChange";
    };
  };
}
