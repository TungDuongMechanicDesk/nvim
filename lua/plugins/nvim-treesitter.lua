return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install {
      "lua", "ruby", "javascript", "markdown", "vue", "pug", "html", "css"
    }

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { "lua",  "javascript", "markdown", "vue", "pug", "html", "css" },
      callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
    vim.cmd('autocmd FileType ruby setlocal indentkeys-=.')
  end
}
