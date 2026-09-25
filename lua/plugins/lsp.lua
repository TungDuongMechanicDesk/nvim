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
          -- "solargraph",
          "clangd",
          "vtsls",
          "vue-language-server",
        },
      })

      local capabilities = require("blink.cmp").get_lsp_capabilities()

      local mason_path = vim.fn.stdpath("data") .. "/mason/packages"
      local vue_plugin_path = mason_path .. "/vue-language-server/node_modules/@vue/language-server"

      require("lspconfig.configs").vtsls = require("vtsls").lspconfig

      vim.lsp.config("vtsls", {
        capabilities = capabilities,
        filetypes = { "javascript", "typescript", "vue" },
        settings = {
          vtsls = {
            tsserver = {
              experimental = { enableProjectDiagnostics = false },
              globalPlugins = {
                {
                  name = "@vue/typescript-plugin",
                  location = vue_plugin_path,
                  languages = { "vue" },
                },
              },
            },
          },
        },
      })
      vim.lsp.enable("vtsls")

      vim.lsp.config("vue_ls", {
        capabilities = capabilities,
        init_options = {
          vue = { hybridMode = true },
        },
      })
      vim.lsp.enable("vue_ls")

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })
      vim.lsp.enable("lua_ls")

      vim.lsp.config("clangd", {
        capabilities = capabilities,
      })
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
