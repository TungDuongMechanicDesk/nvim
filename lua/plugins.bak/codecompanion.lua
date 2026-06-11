vim.pack.add({ "https://github.com/nvim-lua/plenary.nvim" })
vim.pack.add({ "https://github.com/olimorris/codecompanion.nvim" })
vim.pack.add({ "https://github.com/j-hui/fidget.nvim" })
vim.pack.add({ "https://github.com/MeanderingProgrammer/render-markdown.nvim" })

require("fidget").setup({
	notification = { window = { winblend = 0, border = "rounded" } },
})

require("render-markdown").setup({
	file_types = { "markdown", "codecompanion" },
})

local progress_handle = nil
vim.api.nvim_create_autocmd("User", {
	pattern = "CodeCompanionRequest*",
	group = vim.api.nvim_create_augroup("CodeCompanionFidgetHooks", { clear = true }),
	callback = function(args)
		if args.match == "CodeCompanionRequestStarted" then
			local progress = require("fidget.progress")
			progress_handle = progress.handle.create({
				title = "CodeCompanion",
				message = "Processing...",
				lsp_client = { name = "Gemini" },
			})
		elseif args.match == "CodeCompanionRequestFinished" then
			if progress_handle then
				progress_handle:finish()
				progress_handle = nil
			end
		end
	end,
})

require("codecompanion").setup({
	adapters = {
		http = {
			gemini = function()
				return require("codecompanion.adapters").extend("gemini", {
					schema = {
						model = {
							default = "gemini-3.1-flash-lite",
							choices = {
								"gemini-3.1-flash-lite",
								"gemini-2.5-flash",
							},
						},
					},
				})
			end,
		},
	},
	strategies = {
		chat = { adapter = "gemini" },
		inline = { adapter = "gemini" },
		agent = { adapter = "gemini" },
	},
	display = {
		chat = {
			window = {
				layout = "float",
			},
			show_settings = false,
		},
	},
})

vim.keymap.set("v", "ee", "<cmd>CodeCompanion /explain<CR>", { noremap = true, silent = true })
