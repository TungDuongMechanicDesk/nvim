return {
  {
		"nvim-mini/mini.indentscope",
		version = false,
		opts = {
			symbol = "│",
			options = { try_as_border = true },
			draw = {
				delay = 0,
				animation = function()
					return 0
				end,
			},
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"lazy",
					"neo-tree",
					"notify",
          "neo-test"
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
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
						"neo-tree",
						"notify",
					},
				},
			})
		end,
	},
}
