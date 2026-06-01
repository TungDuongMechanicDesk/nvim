vim.pack.add({
	{
		src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
		version = vim.version.range("3"),
	},
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
})

vim.keymap.set("n", "sf", ":Neotree reveal float<CR>", { desc = "NeoTree File Browser", silent = true })
vim.keymap.set("n", "<C-b>", ":Neotree toggle left<CR>", { desc = "Toggle NeoTree Left", silent = true })

require("neo-tree").setup({
	close_if_last_window = true,
	popup_border_style = "rounded",
	window = {
		mappings = {
			["/"] = "fuzzy_finder",
			["q"] = "close_window",
			["h"] = "navigate_up",
		},
	},
	filesystem = {
		follow_current_file = { enabled = true },
		use_libuv_file_watcher = true,
		filtered_items = {
			visible = true,
			hide_dotfiles = false,
			hide_gitignored = true,
		},
	},
})
