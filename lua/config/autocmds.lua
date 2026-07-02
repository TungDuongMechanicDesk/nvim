-- Ruby 2.1 Configuration
vim.api.nvim_create_autocmd("FileType", {
	pattern = "ruby",
	callback = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		vim.lsp.start({
			name = "solargraph",
			cmd = { "solargraph", "stdio" },
			capabilities = capabilities,
			init_options = {
				maxCompletions = 20,
			},
			settings = {
				solargraph = {
					diagnostics = true,
					completion = true,
				},
			},
		})
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.schedule(function()
			vim.keymap.set("n", "gf", function()
				local word = vim.fn.expand("<cword>")
				if word ~= "" then
					require("fzf-lua").tags({ search = word })
				else
					pcall(vim.cmd, "normal! gf")
				end
			end, { buffer = true, desc = "GF via Fzf-Lua Tags" })
		end)
	end,
})

-- Neovim Config
local colors = require('config.colors').palette

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
		vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = colors.yellow })
		vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = colors.blue })
		vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = colors.cyan })
	end,
})

