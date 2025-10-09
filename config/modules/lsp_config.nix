{
  lib,
  pkgs,
  ...
}: {
  plugins.lsp = {
    enable = true;
    inlayHints = true;

    servers = {
      nixd = {
        enable = true;
        settings = let
          flake = ''(builtins.getFlake "github:elythh/flake")'';
          flakeNixvim = ''(builtins.getFlake "github:elythh/nixvim")'';
        in {
          nixpkgs.expr = ''import ${flake}.inputs.nixpkgs { }'';
          formatting.command = ["${lib.getExe pkgs.nixfmt-rfc-style}"];
          options = {
            nixos.expr = ''${flake}.nixosConfigurations.grovetender.options'';
            nixvim.expr = ''${flakeNixvim}.packages.${pkgs.system}.default.options'';
          };
        };
      };

      yamlls = {
        enable = true;
        settings.schemaStore = {
          enable = false;
          url = "";
        };
      };

      lua_ls = {
        enable = true;
        settings.telemetry.enable = false;
      };

      harper_ls = {
        enable = false;
        settings.settings = {
          "harper-ls" = {
            linters = {
              boring_words = true;
              linking_verbs = true;
              sentence_capitalization = false;
              spell_check = false;
            };
            codeActions.forceStable = true;
          };
        };
      };

      # Python
      ruff = {
        enable = true;
        package = pkgs.ruff;
      };

      pyright = {
        enable = true;
        settings = {
          pyright.disableOrganizeImports = true; # imports handled by Ruff

          python.analysis = {
            diagnosticMode = "workspace";
            typeCheckingMode = "basic";
            autoSearchPaths = true;
            useLibraryCodeForTypes = true;

            diagnosticSeverityOverrides = {
              reportAttributeAccessIssue = "error";
              reportGeneralTypeIssues = "error";
              reportUnknownMemberType = "warning";
              reportOptionalMemberAccess = "warning";
            };
          };
        };
      };

      dockerls.enable = true;
      bashls.enable = true;
      clangd.enable = true;
      markdown_oxide.enable = true;
    };

    keymaps = {
      silent = true;
      lspBuf = {
        gd = {
          action = "definition";
          desc = "Goto Definition";
        };
        gr = {
          action = "references";
          desc = "Goto References";
        };
        gD = {
          action = "declaration";
          desc = "Goto Declaration";
        };
        gI = {
          action = "implementation";
          desc = "Goto Implementation";
        };
        gT = {
          action = "type_definition";
          desc = "Type Definition";
        };
        "<leader>rn" = {
          action = "rename";
          desc = "Rename";
        };
        "<leader>ca" = {
          action = "code_action";
        };
      };
    };
  };

  # Rounded borders for LSP windows
  extraConfigLua = ''
    vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("ruff_utf16", { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and (client.name == "ruff" or client.name == "ruff_lsp") then
          client.offset_encoding = "utf-16"
        end
      end,
    })
    local _border = "rounded"
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = _border })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = _border })
    vim.diagnostic.config({ float = { border = _border } })
    require('lspconfig.ui.windows').default_options = { border = _border }
  '';
}
