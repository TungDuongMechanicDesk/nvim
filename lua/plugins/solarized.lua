return {
  "maxmx03/solarized.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local solarized = require('solarized')

    solarized.setup({
      palette = "solarized",
      variant = "spring",
      on_highlights = function(colors)
        return {
          FzfLuaHeaderBind         = { fg = colors.cyan, bold = true },

          WinSeparator             = { fg = colors.base2, bg = colors.base3 },
          WinSeparatorNC           = { fg = colors.base2, bg = colors.base3 },
          VertSplit                = { fg = colors.base2, bg = colors.base3 },

          NormalFloat              = { bg = colors.base3, fg = colors.base00 },
          FloatBorder              = { bg = colors.base3, fg = colors.cyan },
          NoiceCmdline             = { bg = colors.base3 },
          NoiceCmdlinePopup        = { bg = colors.base3 },
          NoiceCmdlinePopupBorder  = { bg = colors.base3, fg = colors.cyan },
          NoiceCmdlineIcon         = { fg = colors.blue, bold = true },
          NoiceCmdlineIconInput    = { fg = colors.blue, bold = true },
          NoiceCmdlinePrompt       = { fg = colors.blue, bold = true },

          DiagnosticUnderlineError = { undercurl = true, sp = colors.diag_error },
          DiagnosticUnderlineWarn  = { undercurl = true, sp = colors.diag_warning },
          DiagnosticUnderlineInfo  = { undercurl = true, sp = colors.diag_info },
          DiagnosticUnderlineHint  = { undercurl = true, sp = colors.diag_hint },
          DiagnosticUnderlineOk    = { undercurl = true, sp = colors.diag_ok },

          InclineNormal            = { bg = colors.magenta, fg = colors.base03 },
          InclineNormalNC          = { bg = colors.base2, fg = colors.base03 },
        }
      end,
    })

    vim.cmd.colorscheme("solarized")
  end,

  -- {
  --   "craftzdog/solarized-osaka.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("solarized-osaka").setup({
  --       on_highlights = function(hl, colors)
  --         hl.InclineNormal   = { bg = colors.magenta500, fg = colors.base03 }
  --         hl.InclineNormalNC = { bg = colors.violet500, fg = colors.base03 }
  --       end
  --     })
  --     vim.cmd [[colorscheme solarized-osaka]]
  --   end
  -- }
  -- {
  -- "ellisonleao/gruvbox.nvim",
  -- priority = 1000,
  -- config = function()
  --   require("gruvbox").setup({
  --   })
  --   vim.cmd([[colorscheme gruvbox]])
  -- end
  -- }
  -- {
  --   "catppuccin/nvim", name = "catppuccin", priority = 1000,
  --   config = function()
  --     require("catppuccin").setup({
  --       auto_integrations = true,
  --     })
  --     vim.cmd.colorscheme "catppuccin-mocha"
  --   end
  -- }
}
