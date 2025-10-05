{
  plugins.bufdelete.enable = true;
  keymaps = [
    {
      mode = "n";
      key = "<leader>x";
      action = "<cmd>Bdelete<CR>";
      options.desc = "Close buffer";
    }
  ];
}
