{ pkgs, ... }:

{
  catppuccin.yazi= {
    enable = true;
    flavor = "mocha";
  };
  programs.yazi = {
    enable = true;
  };
}

