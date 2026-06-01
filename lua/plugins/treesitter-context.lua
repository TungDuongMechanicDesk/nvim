vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter-context.git" })

require("treesitter-context").setup({
	enable = true,
	max_lines = 3,
	trim_scope = "outer",
})
