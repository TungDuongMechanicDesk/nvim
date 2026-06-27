return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
   "MunifTanjim/nui.nvim",
  },
  lazy = false,
  config = function()
    require("neo-tree").setup({
      window = {
        mappings = {
          ["h"] = "navigate_up"
        }
      }
    })
    vim.keymap.set("n", "<C-b>", ":Neotree toggle left<CR>", { desc = "Toggle NeoTree Left", silent = true })
  end
}

