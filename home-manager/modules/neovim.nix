{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.nix4nvchad.homeManagerModule
  ];

  programs.nvchad = {
    enable = true;

    extraPackages = with pkgs; [
      nodePackages.bash-language-server
      docker-compose-language-service
      dockerfile-language-server-nodejs
      emmet-language-server
      nixd
      (python3.withPackages (ps:
        with ps; [
          python-lsp-server
          flake8
        ]))
    ];

    extraConfig = ''
      -- cấu hình cơ bản
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.colorcolumn = "100"
      vim.opt.clipboard = "unnamedplus"

      local conform = require("conform")

      -- Tạo command :Format để format code thủ công
      vim.api.nvim_create_user_command("Format", function()
        conform.format({ async = true, lsp_fallback = true })
      end, {})

      -- Format trước khi thoát Neovim
      vim.api.nvim_create_autocmd("VimLeavePre", {
        callback = function()
          conform.format({ async = false, lsp_fallback = true })
        end,
      })
      
      -- Cấu hình neoscroll
      require('neoscroll').setup({
        easing_function = "sine",
        hide_cursor = true,
        stop_eof = true,
        respect_scrolloff = false,
        cursor_scrolls_alone = true
      })
      -- Cấu hình catppuccin
      require("catppuccin").setup({
          flavour = "mocha", -- latte, frappe, macchiato, mocha
          background = { -- :h background
              light = "latte",
              dark = "mocha",
          },
          transparent_background = false,
          show_end_of_buffer = false, -- show the '~' characters after the end of buffers
          term_colors = false,
          dim_inactive = {
              enabled = false,
              shade = "dark",
              percentage = 0.15,
          },
          no_italic = false, -- Force no italic
          no_bold = false, -- Force no bold
          styles = {
              comments = { "italic" },
              conditionals = { "italic" },
              loops = {},
              functions = {},
              keywords = {},
              strings = {},
              variables = {},
              numbers = {},
              booleans = {},
              properties = {},
              types = {},
              operators = {},
          },
          color_overrides = {},
          custom_highlights = {},
          integrations = {
              cmp = true,
              gitsigns = true,
              nvimtree = true,
              telescope = true,
              notify = false,
              mini = false,
          },
      })

      -- setup must be called before loading
      vim.cmd.colorscheme "catppuccin"

    '';

    extraPlugins = ''
      return {
        { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
        {
           "m4xshen/hardtime.nvim",
           lazy = false,
           dependencies = { "MunifTanjim/nui.nvim" },
           opts = {},
        },
        { "MeanderingProgrammer/render-markdown.nvim" },
        { "karb94/neoscroll.nvim" },
        { "stevearc/conform.nvim",
          config = function()
          require("conform").setup({
            formatters_by_ft = {
            nix = { "alejandra" },
            lua = { "stylua" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            html = { "prettier" },  
            python = { "black" },
            },
          })
          end,
        },
      }
    '';

    hm-activation = true;
    backup = true;
  };
}
