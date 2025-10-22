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
      vim.g.experimental_check_rtp_message = false  -- Ẩn thông báo cảnh báo về thứ tự tải
      vim.g.experimental_check_rtp = false  -- Tắt kiểm tra thứ tự tải hoàn toàn
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
      require("luxmotion").setup({
        cursor = {
          duration = 250,       -- Cursor animation duration (ms)
          easing = "ease-out",  -- Cursor easing function
          enabled = true,
        },
        scroll = {
          duration = 400,       -- Scroll animation duration (ms)
          easing = "ease-out",  -- Scroll easing function
          enabled = true,
        },
        performance = {
          enabled = false,      -- Enable performance mode
        },
        keymaps = {
          cursor = true,        -- Enable cursor motion keymaps
          scroll = true,        -- Enable scroll motion keymaps
        },
      })
      require('peek').setup({
        auto_load = true,         -- whether to automatically load preview when
                                  -- entering another markdown buffer
        close_on_bdelete = true,  -- close preview window on buffer delete

        syntax = true,            -- enable syntax highlighting, affects performance

        theme = 'dark',           -- 'dark' or 'light'

        update_on_change = true,

        app = 'firefox',          -- 'webview', 'browser', string or a table of strings
                                  -- explained below

        filetype = { 'markdown' },-- list of filetypes to recognize as markdown

        -- relevant if update_on_change is true
        throttle_at = 200000,     -- start throttling when file exceeds this
                                  -- amount of bytes in size
        throttle_time = 'auto',   -- minimum amount of time in milliseconds
                                  -- that has to pass before starting new render
      })
    '';

    extraPlugins = ''
      return {
        {
          "toppair/peek.nvim",
          event = { "VeryLazy" },
          build = "deno task --quiet build:fast",
          config = function()
          require("peek").setup()
          vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
          vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
          end,
        },        
        {"LuxVim/nvim-luxmotion",},
        {
          "m4xshen/hardtime.nvim",
          lazy = false,
          dependencies = { "MunifTanjim/nui.nvim" },
          opts = {},
        },
        {
          "stevearc/conform.nvim",
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
        {
          "sontungexpt/vietnamese.nvim",
          dependencies = {
            "sontungexpt/bim.nvim",
            "nvim-web-devicons",
          },
          event = "InsertEnter",
          config = function()
            require("vietnamese").setup()
          end,
        },
        {
          "lervag/vimtex",
          lazy = false,     -- we don't want to lazy load VimTeX
          config = function()
            vim.keymap.set("n", "<Leader>ll", "<Plug>(vimtex-compile)", { desc = "Vimtex Compile" })
          end,
          init = function()
          -- VimTeX configuration goes here, e.g.
          vim.g.vimtex_view_method = "zathura"
          vim.g.vimtex_compiler_method = "latexmk"
          end
        },
      }
    '';

    hm-activation = true;
    backup = true;
  };
}
