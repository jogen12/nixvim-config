{
  config,
  lib,
  ...
}: let
  get_bufnrs.__raw = ''
    function()
      local buf_size_limit = 1024 * 1024 -- 1MB size limit
      local bufs = vim.api.nvim_list_bufs()
      local valid_bufs = {}
      for _, buf in ipairs(bufs) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf)) < buf_size_limit then
          table.insert(valid_bufs, buf)
        end
      end
      return valid_bufs
    end
  '';
in {
  plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        window = {
          completion.__raw = ''
            require("cmp").config.window.bordered({
              border = "rounded",
              winhighlight = "Normal:Pmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
              scrollbar = false,
            })
          '';
          documentation.__raw = ''
            require("cmp").config.window.bordered({
              border = "rounded",
              winhighlight = "Normal:NormalFloat,FloatBorder:CmpDocBorder",
            })
          '';
        };
        mapping = {
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.close()";
          "<CR>" = "cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace })";
          "<Tab>" = ''
            cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif require("luasnip").expand_or_jumpable() then
                vim.fn.feedkeys(
                  vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
                  ""
                )
              else
                fallback()
              end
            end, {
              "i",
              "s",
            })
          '';
          "<S-Tab>" = ''
            cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif require("luasnip").jumpable(-1) then
                vim.fn.feedkeys(
                  vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true),
                  ""
                )
              else
                fallback()
              end
            end, {
              "i",
              "s",
            })
          '';
        };

        preselect = "cmp.PreselectMode.None";

        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";

        sources = [
          {
            name = "nvim_lsp";
            priority = 1000;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            name = "nvim_lsp_signature_help";
            priority = 1000;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            name = "gitlab";
            priority = 1000;
            option = {
              hosts = ["https://gitlab.dnm.radiofrance.fr"];
            };
          }
          {
            name = "nvim_lsp_document_symbol";
            priority = 1000;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            name = "treesitter";
            priority = 850;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            name = "luasnip";
            priority = 750;
          }
          {
            name = "buffer";
            priority = 500;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            name = "rg";
            priority = 300;
          }
          {
            name = "path";
            priority = 300;
          }
          {
            name = "cmdline";
            priority = 300;
          }
          {
            name = "spell";
            priority = 300;
          }
          {
            name = "git";
            priority = 250;
          }
          {
            name = "zsh";
            priority = 250;
          }
          {
            name = "calc";
            priority = 150;
          }
        ];
      };
    };

    friendly-snippets.enable = true;
  };
  keymaps = lib.mkIf config.plugins.cmp.enable [
    {
      mode = [
        "i"
        "s"
      ];
      key = "<C-k>";
      action.__raw = ''
        function()
         local ls = require "luasnip"
         if ls.expand_or_jumpable() then
           ls.expand_or_jump()
         end
        end
      '';
    }
    {
      mode = [
        "i"
        "s"
      ];
      key = "<C-j>";
      action.__raw = ''
        function()
         local ls = require "luasnip"
         if ls.jumpable(-1) then
           ls.jump(-1)
         end
        end
      '';
    }
  ];
}
