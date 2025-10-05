{
  plugins.indent-blankline = {
    enable = true;
    settings = {
      scope.enabled = false;
      exclude = {
        filetypes = ["dashboard" "alpha" "starter" "neo-tree" "lazy" "help"];
        buftypes = ["terminal" "nofile"];
      };
    };
  };
}
