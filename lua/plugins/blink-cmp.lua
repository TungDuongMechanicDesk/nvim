vim.pack.add({ "https://github.com/L3MON4D3/LuaSnip" })
vim.pack.add({ "https://github.com/rafamadriz/friendly-snippets" })
vim.pack.add({ "https://github.com/saghen/blink.lib" })
vim.pack.add({ "https://github.com/saghen/blink.cmp" })

local cmp = require("blink.cmp")
cmp.build():pwait()

cmp.setup({
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
		providers = {
			buffer = {
				opts = {
					get_bufnrs = function()
						return { vim.api.nvim_get_current_buf() }
					end,
				},
			},
		},
	},
	snippets = {
		preset = "luasnip",
	},
	appearance = {
		nerd_font_variant = "mono",
	},
	completion = {
		list = {
			selection = {
				preselect = false,
				auto_insert = false,
			},
		},
		menu = {
			draw = {
				columns = {
					{ "label", gap = 1 },
					{ "kind_icon" },
					{ "source_name" },
				},
				treesitter = { "lsp" },
				components = {
					source_name = {
						text = function(ctx)
							return "[" .. ctx.source_name .. "]"
						end,
						highlight = "BlinkCmpSource",
					},
				},
			},
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 500,
			window = {
				border = "rounded",
			},
		},
	},
	keymap = {
		["<CR>"] = { "accept", "fallback" },
		["<Tab>"] = { "select_next", "fallback" },
		["<S-Tab>"] = { "select_prev", "fallback" },
		["<Up>"] = { "select_prev", "fallback" },
		["<Down>"] = { "select_next", "fallback" },
		["<C-b>"] = { "scroll_documentation_up", "fallback" },
		["<C-f>"] = { "scroll_documentation_down", "fallback" },
		["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-e>"] = { "hide", "fallback" },
	},
	signature = {
		enabled = true,
	},
	fuzzy = {
		implementation = "rust",
	},
})
