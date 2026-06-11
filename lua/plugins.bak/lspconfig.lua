vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

vim.lsp.config.lua_ls = {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
}

vim.lsp.enable({
	"solargraph",
	"eslint",
	"ts_ls",
	"lua_ls",
	"clangd",
})
