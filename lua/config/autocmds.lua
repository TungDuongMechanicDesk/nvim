local colors = require("config.colors").palette

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
		vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = colors.yellow })
		vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = colors.blue })
		vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = colors.cyan })

    -- vim.api.nvim_set_hl(0, "IblIndent", { fg = colors.base1, nocombine = true })

    vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = colors.base1, italic = true })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "ruby",
	callback = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		vim.lsp.start({
			name = "solargraph",
			cmd = { "solargraph", "stdio" },
			capabilities = capabilities,
      init_options = {
				maxCompletions = 100,
			},
			settings = {
				solargraph = {
					diagnostics = true,
          completion = true
				}
			}
		})
	end,
})
