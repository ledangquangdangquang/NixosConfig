{pkgs, ...}: {
  catppuccin.yazi = {
    enable = true;
    flavor = "mocha";
  };
  programs.yazi = {
    enable = true;
    plugins = with pkgs.yaziPlugins; {
      full-border = full-border;
      smart-enter = smart-enter;
      toggle-pane = toggle-pane;
      mediainfo = mediainfo;
    };
    settings = {
      opener = {
        pdff = [
          {
            run = ''
              zathura "$@"
            '';
            desc = "Open with Zathura";
            block = false;
            orphan = true;
            for = "unix";
          }
        ];
      };
      open = {
        prepend_rules = [
          {
            name = "*.pdf";
            use = "pdff";
          }
        ];
      };
    };
    # Gọi setup plugin trong init.lua
    initLua = ''
      require("full-border"):setup()
    '';
    keymap = {
      mgr = {
        prepend_keymap = [
          {
            on = "l";
            run = "plugin smart-enter";
            desc = "Enter the child directory, or open the file";
          }
          {
            on = "T";
            run = "plugin toggle-pane min-preview";
            desc = "Show or hide the preview pane";
          }
          {
            on = "T";
            run = "plugin toggle-pane max-preview";
            desc = "Maximize or restore the preview pane";
          }
        ];
      };
    };
  };
}
