return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "\\\\",
        function()
          require("telescope.builtin").buffers()
        end,
      },
      {
        ";t",
        function()
          require("telescope.builtin").help_tags()
        end,
      },
      {
        ";;",
        function()
          require("telescope.builtin").resume()
        end,
      },
      {
        ";e",
        function()
          require("telescope.builtin").diagnostics()
        end,
      },
      {
        "sf",
        function()
          local telescope = require("telescope")
          telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = vim.loop.cwd(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 40 },
          })
        end,
      },
    },
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local fb_actions = require("telescope").extensions.file_browser.actions

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        wrap_results = true,
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          n = {},
        },
      })
      opts.extensions = {
        file_browser = {
          theme = "dropdown",
          hijack_netrw = true,
          mappings = {
            ["i"] = {
              ["<C-N>"] = fb_actions.create,
              ["<h>"] = fb_actions.goto_parent_dir,
              ["<C-D>"] = fb_actions.remove,
            },
            ["n"] = {
              ["N"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["/"] = fb_actions.change_cwd,
              ["D"] = fb_actions.remove,
            },
          },
        },
      }
      telescope.setup(opts)
      telescope.load_extension("file_browser")
    end,
  },
}
