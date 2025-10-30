{pkgs, ...}: {
  plugins.treesitter = {
    enable = true;
    settings = {
      indent.enable = true;
      highlight.enable = true;
    };
    folding = false;
    nixvimInjections = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
  };

  plugins.treesitter-textobjects = {
    enable = true;
    settings = {
      select = {
        enable = true;
        lookahead = true;

        keymaps = [
          {
            key = "aa";
            query = "@parameter.outer";
          }
          {
            key = "ia";
            query = "@parameter.inner";
          }
          {
            key = "af";
            query = "@function.outer";
          }
          {
            key = "if";
            query = "@function.inner";
          }
          {
            key = "ac";
            query = "@class.outer";
          }
          {
            key = "ic";
            query = "@class.inner";
          }
          {
            key = "ii";
            query = "@conditional.inner";
          }
          {
            key = "ai";
            query = "@conditional.outer";
          }
          {
            key = "il";
            query = "@loop.inner";
          }
          {
            key = "al";
            query = "@loop.outer";
          }
          {
            key = "at";
            query = "@comment.outer";
          }
        ];
      };

      move = {
        enable = true;
        goto_next_start = [
          {
            key = "]m";
            query = "@function.outer";
          }
          {
            key = "]]";
            query = "@class.outer";
          }
        ];
        goto_next_end = [
          {
            key = "]M";
            query = "@function.outer";
          }
          {
            key = "][";
            query = "@class.outer";
          }
        ];
        goto_previous_start = [
          {
            key = "[m";
            query = "@function.outer";
          }
          {
            key = "[[";
            query = "@class.outer";
          }
        ];
        goto_previous_end = [
          {
            key = "[M";
            query = "@function.outer";
          }
          {
            key = "[]";
            query = "@class.outer";
          }
        ];
      };

      swap = {
        enable = true;
        swap_next = [
          {
            key = "<leader>a";
            query = "@parameter.inner";
          }
        ];
        swap_previous = [
          {
            key = "<leader>A";
            query = "@parameter.outer";
          }
        ];
      };
    };
  };
}
