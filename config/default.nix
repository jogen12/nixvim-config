{
  imports = [
    ./keymaps.nix
    ./options.nix

    ./modules/lsp_config.nix
    ./modules/conform.nix

    ./modules/autopairs.nix
    ./modules/neoscroll.nix
    ./modules/bufdelete.nix
    ./modules/colourscheme.nix
    ./modules/comment.nix
    ./modules/completions.nix
    ./modules/gitsigns.nix
    ./modules/illuminate.nix
    ./modules/indent-blackline.nix
    ./modules/lualine.nix
    ./modules/markdown-preview.nix
    ./modules/markview.nix
    ./modules/nvim-surround.nix
    ./modules/telescope.nix
    ./modules/treesitter.nix
  ];
}
