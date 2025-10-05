{pkgs, ...}: {
  plugins.web-devicons.enable = true;
  plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native.enable = true;
      ui-select = {
        enable = true;
        settings.__raw = "require('telescope.themes').get_dropdown({ winblend = 0 })";
      };

      file-browser = {
        enable = true;
        settings = {
          path = "%:p:h";
          select_buffer = true;
          hide_parent_dir = true;
          grouped = true;
          cwd_to_path = true;
          sorting_strategy = "ascending";
          initial_mode = "normal";

          mappings.n = {
            "<Tab>" = {__raw = "require('telescope.actions').toggle_selection";};
            "l" = {__raw = "require('telescope').extensions.file_browser.actions.open_dir";};
            "h" = {__raw = "require('telescope').extensions.file_browser.actions.goto_parent_dir";};
            "a" = {__raw = "require('telescope').extensions.file_browser.actions.create";};
          };
        };
      };
    };
    settings = {
      defaults = {
        vimgrep_arguments = ["${pkgs.ripgrep}/bin/rg" "-L" "--color=never" "--no-heading" "--with-filename" "--line-number" "--column" "--smart-case" "--fixed-strings"];
        selection_caret = "  ";
        entry_prefix = "  ";
        layout_strategy = "flex";
        layout_config = {
          horizontal = {
            prompt_position = "top";
          };
        };
        sorting_strategy = "ascending";
        file_ignore_patterns = ["^.git/" "^.mypy_cache/" "^__pycache__/" "^output/" "^data/" "%.ipynb"];
        set_env.COLORTERM = "truecolor";
      };

      pickers = {
        colorscheme = {
          enable_preview = true;
        };
      };
    };
  };
  keymaps = [
    # Navigation
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<cr>";
      options.desc = "Telescope find files";
    }
    {
      mode = "n";
      key = "<leader>fg";
      action = "<cmd>Telescope live_grep<cr>";
      options.desc = "Telescope live grep";
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = "<cmd>Telescope buffers<cr>";
      options.desc = "Telescope buffers";
    }
    {
      mode = "n";
      key = "<leader>fh";
      action = "<cmd>Telescope help_tags<cr>";
      options.desc = "Telescope help tags";
    }
    {
      mode = "n";
      key = "<leader>n";
      action = "<cmd>Telescope file_browser<cr>";
      options.desc = "Telescope file browser";
    }

    # LSP
    {
      mode = "n";
      key = "<leader>gr";
      action = "<cmd>Telescope lsp_references<cr>";
    }
    {
      mode = "n";
      key = "<leader>gd";
      action = "<cmd>Telescope lsp_definitions<cr>";
    }
    {
      mode = "n";
      key = "<leader>gi";
      action = "<cmd>Telescope lsp_implementations<cr>";
    }
    {
      mode = "n";
      key = "<leader>fd";
      action = "<cmd>Telescope diagnostics bufnr=0<cr>";
      options.desc = "Telescope diagnostics (current buffer)";
    }
  ];
  extraPackages = with pkgs; [ripgrep];
}
