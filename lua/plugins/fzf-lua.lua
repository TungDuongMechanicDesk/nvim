vim.pack.add({
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	"https://github.com/nvim-treesitter/nvim-treesitter-context.git",
})

vim.keymap.set("n", ";f", function()
	require("fzf-lua").files({ cmd = "rg --files --hidden -g '!.git/'" })
end, { noremap = true, silent = true, desc = "Find Files" })

vim.keymap.set("n", ";r", function()
	require("fzf-lua").live_grep()
end, { noremap = true, silent = true, desc = "Live Grep" })

vim.keymap.set("n", "\\\\", function()
	require("fzf-lua").buffers()
end, { noremap = true, silent = true, desc = "Find Buffers" })

require("fzf-lua").setup({
	winopts = {
		preview = {
			default = "bat",
		},
	},
})
