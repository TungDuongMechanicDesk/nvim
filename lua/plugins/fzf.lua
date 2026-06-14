return {
  {
    "ibhagwan/fzf-lua",
    dependencies = {
      "tpope/vim-rails",
    },
    keys = {
      {
        ";f",
        function()
          require("fzf-lua").files({ cmd = "rg --files --hidden -g '!.git/'" })
        end,
        desc = "Find Files",
      },
      {
        ";r",
        function()
          require("fzf-lua").live_grep()
        end,
        desc = "Live Grep",
      },
      {
        "gf",
        function()
          local success, _ = pcall(function()
            vim.cmd("normal! gf")
          end)
          if not success then
            require("fzf-lua").tags({ search = vim.fn.expand("<cword>") })
          end
        end,
        desc = "Smart Jump (Rails gf / FZF Tags)",
      },
    },
    opts = {
      winopts = {
        preview = {
          default = "bat",
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {},
  },
}
