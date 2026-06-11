return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"yioneko/nvim-vtsls",
		},
		config = function()
			require("mason").setup()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"lua-language-server",
					"solargraph",
					"clangd",
					"vtsls",
					"vue-language-server",
				},
			})

			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local mason_path = vim.fn.stdpath("data") .. "/mason/packages"
			local vue_plugin_path = mason_path .. "/vue-language-server/node_modules/@vue/language-server"

			require("lspconfig.configs").vtsls = require("vtsls").lspconfig

			local function get_config(name)
				local conf = require("lspconfig.configs")[name]
				return conf and conf.default_config or {}
			end

			local vtsls_config = get_config("vtsls")
			vtsls_config.capabilities = capabilities
			vtsls_config.settings = {
				vtsls = {
					tsserver = {
						experimental = { enableProjectDiagnostics = false },
						globalPlugins = {
							{ name = "@vue/typescript-plugin", location = vue_plugin_path, languages = { "vue" } },
						},
					},
				},
			}
			vtsls_config.filetypes = { "javascript", "typescript", "vue" }

			vim.lsp.config("vtsls", vtsls_config)
			vim.lsp.enable("vtsls")

			local vue_ls_config = get_config("vue_ls")
			vue_ls_config.capabilities = capabilities

			vue_ls_config.on_new_config = function(new_config, new_root_dir) end

			vue_ls_config.init_options = {
				vue = { hybridMode = true },
			}

			vim.lsp.config("vue_ls", vue_ls_config)
			vim.lsp.enable("vue_ls")

			local lua_config = get_config("lua_ls")
			lua_config.settings = { Lua = { diagnostics = { globals = { "vim" } } } }
			vim.lsp.config("lua_ls", lua_config)
			vim.lsp.enable("lua_ls")

			-- local ruby_config = get_config("ruby_lsp")
			-- ruby_config.init_options = {
			-- 	addonSettings = { ["Ruby LSP Rails"] = { enablePendingMigrationsPrompt = false } },
			-- }
			-- vim.lsp.config("ruby_lsp", ruby_config)
			-- vim.lsp.enable("ruby_lsp")

      local solargraph_config = get_config("solargraph")
      vim.lsp.config("solargraph", solargraph_config)
      vim.lsp.enable("solargraph")

			local clangd_config = get_config("clangd")
			vim.lsp.config("clangd", clangd_config)
			vim.lsp.enable("clangd")

			vim.diagnostic.config({
				signs = true,
				underline = true,
				virtual_text = {
					spacing = 4,
					prefix = " ",
				},
				update_in_insert = false,
			})
		end,
	},
}

