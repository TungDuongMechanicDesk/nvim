return {
  {
    "ibhagwan/fzf-lua",
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
    },
    opts = {
      winopts = {
        preview = {
          default = "bat",
        },
      },
    },
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter-context",
  --   opts = {},
  -- },
}
