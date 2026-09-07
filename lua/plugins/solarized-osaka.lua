return {
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("solarized-osaka").setup({
				styles = {
					sidebars = "transparent",
				},
			})
			vim.cmd([[ colorscheme solarized-osaka ]])
			local colors = require("solarized-osaka.colors").setup({})
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "*",
				callback = function()
					vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
					vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = colors.yellow })
					vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = colors.blue })
					vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = colors.cyan })
				end,
			})
		end,
	},
  -- {
  --   "polirritmico/monokai-nightasty.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('monokai-nightasty').setup({
  --       vim.cmd.colorscheme("monokai-nightasty")
  --     })
  --   end
  -- }
}
