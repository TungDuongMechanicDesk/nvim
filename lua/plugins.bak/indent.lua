vim.pack.add({ "https://github.com/lukas-reineke/indent-blankline.nvim" })
vim.pack.add({ "https://github.com/nvim-mini/mini.indentscope" })

require("ibl").setup({
	indent = {
		char = "│",
		tab_char = "│",
	},
	scope = { enabled = false },
	exclude = {
		filetypes = {
			"help",
			"lazy",
			"mason",
			"neo-tree",
			"notify",
		},
	},
})

require("mini.indentscope").setup({
	symbol = "│",
	options = { try_as_border = true },
	draw = {
		delay = 0,
		animation = function()
			return 0
		end,
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"help",
		"lazy",
		"mason",
		"neo-tree",
		"notify",
	},
	callback = function()
		vim.b.miniindentscope_disable = true
	end,
})
