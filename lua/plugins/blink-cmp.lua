return {
  "saghen/blink.cmp",
  version = "1.*",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  },
  opts = {
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
      ["<Tab>"] = { "accept", "fallback" },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide", "fallback" },
    },
    signature = {
      enabled = true,
    },
    delay = {
      completion = 50,
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
    },
  },
  opts_extend = { "sources.default" },
}
