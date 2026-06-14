return {
  "ludovicchabant/vim-gutentags",
  config = function()
    vim.g.gutentags_project_root = { "Gemfile", ".git" }
    vim.g.gutentags_ctags_tagfile = ".tags"
    vim.g.gutentags_modules = { "ctags" }
    vim.g.gutentags_ctags_executable = "ripper-tags"
    vim.g.gutentags_plus_nomap = 1
    vim.g.gutentags_ctags_extra_args = {
      "-R",
      "--exclude=vendor",
      "--exclude=log",
      "--exclude=tmp",
      "--exclude=public",
    }
  end,
}
