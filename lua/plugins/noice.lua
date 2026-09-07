return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				presets = {
					bottom_search = true,
					long_message_to_split = true,
					inc_rename = false,
					lsp_doc_border = false,
          command_palette = {
            views = {
              cmdline_popup = {
                position = {
                  row = "50%",
                  col = "50%",
                },
                size = {
                  min_width = 60,
                  width = "auto",
                  height = "auto",
                },
              },
              popupmenu = {
                relative = "editor",
                position = {
                  row = 23,
                  col = "50%",
                },
                size = {
                  width = 60,
                  height = "auto",
                  max_height = 15,
                },
                border = {
                  style = "rounded",
                  padding = { 0, 1 },
                },
                win_options = {
                  winhighlight = { Normal = "Normal", FloatBorder = "NoiceCmdlinePopupBorder" },
                },
              },
            },
          }
				},
			})
		end,
	},
	{
		"rcarriga/nvim-notify",
		config = function()
      local colors = require("solarized-osaka.colors").setup({})
			require("notify").setup({
				background_colour = colors.base01,
				max_width = 50,
				render = "wrapped-default",
				timeout = 1000,
			})
		end,
	},
}
