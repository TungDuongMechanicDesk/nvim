return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install { "lua", "ruby", "javascript", "markdown" }
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { '<filetype>' },
      callback = function() vim.treesitter.start() end,
    })
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end
}
