return {
  "ludovicchabant/vim-gutentags",
  lazy = false,
  init = function()
    vim.g.gutentags_project_root = { ".git", "Gemfile", "Makefile", "package.json" }
    vim.g.gutentags_modules = { "ctags" }
    vim.g.gutentags_cache_dir = vim.fn.expand("~/.cache/nvim/ctags")
    if vim.fn.isdirectory(vim.g.gutentags_cache_dir) == 0 then
      vim.fn.mkdir(vim.g.gutentags_cache_dir, "p")
    end
    vim.g.gutentags_ctags_extra_args = {
      "--fields=+l",
      "--extra=+q",
      "--languages=ruby",
    }
  end,
}
