vim.pack.add({
	"https://github.com/saghen/blink.lib",
	{ src = "https://github.com/saghen/blink.pairs", version = vim.version.range("*") },
})

require("blink.pairs").setup({})
