return {
  "http://github.com/lewis6991/gitsigns.nvim",
  config = function()
    local colors = require("solarized-osaka.colors").setup({})
    require("gitsigns").setup({
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 500,
      },
    })
    vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = colors.base0, italic = true })
  end
}
