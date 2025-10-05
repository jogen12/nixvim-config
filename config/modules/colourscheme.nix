{
  colorschemes = {
    catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        integrations = {
          telescope.enable = true;
          cmp.enable = true;
          illuminate = true;
        };
        custom_highlights = ''
          function()
            -- Accent colors from macchiato, backgrounds from mocha
            local C = require("catppuccin.palettes").get_palette("macchiato")
            local M = require("catppuccin.palettes").get_palette("mocha")
            local O = require("catppuccin").options or {}

            -- Safe check: only read ".lsp" if illuminate is a table
            local illum_lsp =
              (type(O.integrations) == "table")
              and (type(O.integrations.illuminate) == "table")
              and (O.integrations.illuminate.lsp == true)

            local h = {
            -- Telescope
            TelescopeNormal        = { bg = C.mantle },
            TelescopeResultsNormal = { bg = C.mantle },
            TelescopePreviewNormal = { bg = C.mantle },
            TelescopePromptNormal  = { bg = C.mantle },

            TelescopeBorder        = { fg = C.blue, bg = C.mantle },
            TelescopeResultsBorder = { fg = C.blue, bg = C.mantle },
            TelescopePreviewBorder = { fg = C.blue, bg = C.mantle },
            TelescopePromptBorder  = { fg = C.blue, bg = C.mantle },

            TelescopePromptPrefix  = { bg = C.mantle },
            TelescopePromptCounter = { bg = C.mantle },

            TelescopeResultsTitle  = { fg = C.subtext1, bg = C.mantle },
            TelescopePreviewTitle  = { fg = C.subtext1, bg = C.mantle },
            TelescopePromptTitle   = { fg = C.subtext1, bg = C.mantle },

            -- nvim-cmp
            Pmenu                  = { bg = C.mantle },
            PmenuSel               = { bg = C.mantle },
            NormalFloat            = { bg = C.mantle },

            CmpBorder              = { fg = C.blue, bg = C.mantle },
            CmpDocBorder           = { fg = C.blue, bg = C.mantle },

            CmpItemAbbrMatch       = { fg = C.blue },
            CmpItemAbbrMatchFuzzy  = { fg = C.blue },
            CmpItemMenu            = { fg = C.subtext1 },

            -- vim-illuminate
            IlluminatedWordText     = { fg = M.peach, bg = M.base },
            IlluminatedWordRead     = { fg = M.peach, bg = M.base },
            IlluminatedWordWrite    = { fg = M.peach, bg = M.base, style = illum_lsp and { "bold" } or {} },
            }

            -- Optional colorful Telescope title "pills"
            if O.float and O.float.solid then
              h.TelescopePreviewTitle = { fg = M.crust, bg = C.green    }
              h.TelescopePromptTitle  = { fg = M.crust, bg = C.red      }
              h.TelescopeResultsTitle = { fg = M.crust, bg = C.lavender }
            end

            return h
          end
        '';
      };
    };
  };
}
