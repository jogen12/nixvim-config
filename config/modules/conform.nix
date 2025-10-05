{pkgs, ...}: {
  extraPackages = with pkgs; [
    ruff
    stylua
    alejandra
    shfmt
    clang-tools
    nodePackages.prettier
    taplo
    cmake-format
  ];

  plugins = {
    lsp-format.enable = false;

    conform-nvim = {
      enable = true;

      settings = {
        notify_on_error = true;

        format_on_save = {
          timeout_ms = 500;
        };

        formatters_by_ft = {
          python = ["ruff_fix" "ruff_format"];
          lua = ["stylua"];
          nix = ["alejandra"];
          sh = ["shfmt"];
          json = ["prettier"];
          yaml = ["prettier"];
          markdown = ["prettier"];
          toml = ["taplo"];
          c = ["clang-format"];
          cpp = ["clang-format"];
          cmake = ["cmake_format"];
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>gf";
      action = ''
        <cmd>lua require("conform").format({ async = false })<CR>
      '';
      options = {
        silent = true;
        noremap = true;
        desc = "Format buffer (Conform)";
      };
    }
  ];
}
