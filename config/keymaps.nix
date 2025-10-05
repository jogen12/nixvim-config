{
  keymaps = [
    # Navigation in insert mode
    {
      mode = "i";
      key = "<C-h>";
      action = "<Left>";
    }
    {
      mode = "i";
      key = "<C-l>";
      action = "<Right>";
    }
    {
      mode = "i";
      key = "<C-k>";
      action = "<Up>";
    }
    {
      mode = "i";
      key = "<C-j>";
      action = "<Down>";
    }

    # Buffers
    {
      mode = "n";
      key = "<Tab>";
      action = "<cmd>bn<CR>";
      options.desc = "Goto next buffer";
    }
    {
      mode = "n";
      key = "<S-Tab>";
      action = "<cmd>bp<CR>";
      options.desc = "Goto previous buffer";
    }
    {
      mode = "n";
      key = "<leader>X";
      action = "<cmd>bd<CR>";
      options.desc = "Close buffer with window";
    }

    # Для <leader>x нужен :Bdelete (из плагина bufdelete). Включи плагин ниже.
    {
      mode = "n";
      key = "<leader>x";
      action = "<cmd>Bdelete<CR>";
      options.desc = "Close buffer";
    }

    # LSP rename
    {
      mode = "n";
      key = "<leader>rn";
      action.__raw = "vim.lsp.buf.rename";
      options.desc = "Rename";
    }

    # Save
    {
      mode = "n";
      key = "<C-s>";
      action = "<cmd>w<CR>";
    }

    # Copy buffer
    {
      mode = "n";
      key = "<C-c>";
      action = "<cmd>%y+<CR>";
    }

    # Close all buffers except current
    {
      mode = "n";
      key = "<C-a>";
      action = "<cmd>%bd | e#<CR>";
    }

    # Lsp diagnostic
    {
      mode = "n";
      key = "]t";
      action.__raw = "vim.diagnostic.goto_next";
    }
    {
      mode = "n";
      key = "[t";
      action.__raw = "vim.diagnostic.goto_prev";
    }
  ];
}
