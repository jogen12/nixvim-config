{...}: {
  globalOpts = {
    # Line numbers
    number = true;
    relativenumber = true;

    # Enable more colors (24-bit)
    termguicolors = true;

    # Have a better completion experience
    completeopt = [
      "menuone"
      "noselect"
      "noinsert"
    ];

    # Always show the signcolumn, otherwise text would be shifted when displaying error icons
    signcolumn = "auto:1-3";

    # Search
    ignorecase = true;
    smartcase = true;

    # Configure how new splits should be opened
    splitright = true;
    splitbelow = true;

    expandtab = true;
    tabstop = 4;
    shiftwidth = 4;
    softtabstop = 4;
    # smarttab = true;

    # System clipboard support, needs xclip/wl-clipboard
    clipboard = {
      providers.wl-copy.enable = true; # Use wl-copy for wayland and xsel for Xorg
      register = "wl-copy";
    };

    # Set encoding
    encoding = "utf-8";
    fileencoding = "utf-8";

    # Save undo history
    undofile = true;
    swapfile = true;
    backup = false;
    autoread = true;

    # Highlight the current line for cursor
    cursorline = true;

    # Show line and column when searching
    ruler = true;

    # Global substitution by default
    gdefault = true;

    # Start scrolling when the cursor is X lines away from the top/bottom
    scrolloff = 5;
  };

  diagnostic = {
    settings = {
      virtual_text = true;
      signs = true;
      underline = true;
      float = {
        border = "rounded";
        source = "always";
      };
    };
  };

  globals.mapleader = " ";

  autoCmd = [
    {
      event = ["VimEnter"];
      callback.__raw = ''
        function()
          if vim.fn.argc() == 0 then
            vim.schedule(function()
            require('telescope.builtin').find_files()
            end)
          end
        end
      '';
    }
    {
      event = ["VimEnter"];
      command = "set relativenumber";
    }
    {
      event = ["VimEnter"];
      command = "set number";
    }
    {
      event = ["FileType"];
      pattern = ["make"];
      callback.__raw = ''
        function()
          vim.opt_local.expandtab   = false
          vim.opt_local.tabstop     = 4
          vim.opt_local.shiftwidth  = 4
          vim.opt_local.softtabstop = 0
        end
      '';
    }
    {
      event = ["FileType"];
      pattern = ["nix"];
      callback.__raw = ''
        function()
          vim.opt_local.expandtab   = true
          vim.opt_local.tabstop     = 2
          vim.opt_local.shiftwidth  = 2
          vim.opt_local.softtabstop = 2
        end
      '';
    }
    {
      event = ["BufRead" "BufNewFile"];
      pattern = ["*.sh" "*.bash"];
      callback.__raw = ''
        function()
          vim.opt_local.expandtab   = true
          vim.opt_local.tabstop     = 4
          vim.opt_local.shiftwidth  = 4
          vim.opt_local.softtabstop = 4
        end
      '';
    }
  ];
}
