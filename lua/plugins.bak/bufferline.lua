vim.pack.add({ "https://github.com/akinsho/bufferline.nvim" })

vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<cr>")
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<cr>")

require("bufferline").setup({
	options = {
		mode = "tabs",
		always_show_bufferline = false,
		show_buffer_close_icons = false,
		show_close_icon = false,
	},
})
