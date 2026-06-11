vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "solarized",
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		globalstatus = true,
		disabled_filetypes = {},
	},
	sections = {
		lualine_a = {
			{
				"mode",
				icon = "",
			},
		},
		lualine_b = { "branch" },
		lualine_c = {
			{
				"filename",
				file_status = true,
				path = 0,
			},
		},
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = {
					error = " ",
					warn = " ",
					info = " ",
					hint = " ",
				},
			},
			{
				"diff",
				symbols = { added = " ", modified = " ", removed = " " },
				source = function()
					local gitsigns = vim.b.gitsigns_status_dict
					if gitsigns then
						return {
							added = gitsigns.added,
							modified = gitsigns.changed,
							removed = gitsigns.removed,
						}
					end
				end,
			},
			"filetype",
		},
		lualine_y = {
			{ "progress", separator = "", padding = { left = 1, right = 0 } },
			{ "location", padding = { left = 0, right = 1 } },
		},
		lualine_z = {
			function()
				return " " .. os.date("%R")
			end,
		},
	},
})
