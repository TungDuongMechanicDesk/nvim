return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("lspsaga").setup({
			ui = {
				border = "rounded",
				devicon = true,
				foldericon = true,
			},
			hover = {
				open_link = "gx",
				open_cmd = "!chrome",
			},
			diagnostic = {
				show_code_action = true,
				show_layout = "float",
				jump_num_shortcut = true,
				max_width = 0.7,
				custom_msg = "%m [%c]",
			},
			code_action = {
				num_shortcut = true,
				show_server_name = true,
				extend_gitsigns = false,
			},
			lightbulb = {
				enable = false,
			},
      symbol_in_winbar = {
        enable = false,
      },
		})
	end,
	keys = {
		{ "gd", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek definition" },
		{ "gD", "<cmd>Lspsaga goto_definition<CR>", desc = "Go to definition" },
		{ "gh", "<cmd>Lspsaga lsp_finder<CR>", desc = "LSP finder" },
		{ "K", "<cmd>Lspsaga hover_doc<CR>", desc = "Hover doc" },
		{ "gp", "<cmd>Lspsaga preview_definition<CR>", desc = "Preview definition" },
		{ "<space>rn", "<cmd>Lspsaga rename<CR>", desc = "Rename" },
		{ "<space>ca", "<cmd>Lspsaga code_action<CR>", desc = "Code action", mode = { "n", "v" } },
		{ "<space>d", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Show line diagnostics" },
		{ "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Previous diagnostic" },
		{ "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Next diagnostic" },
	},
}
