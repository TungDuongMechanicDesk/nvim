vim.pack.add({ "https://github.com/nvim-neotest/neotest" })
vim.pack.add({ "https://github.com/nvim-neotest/nvim-nio" })
vim.pack.add({ "https://github.com/antoinemadec/fixcursorhold.nvim" })
vim.pack.add({ "https://github.com/nvim-lua/plenary.nvim" })

vim.pack.add({ "https://github.com/olimorris/neotest-rspec" })

require("neotest").setup({
  adapter = {
    require("neotest-rspec")
  }
})

local neotest = require("neotest")
vim.keymap.set("n", "<leader>tt", function() neotest.run.run() end, { desc = "Run nearest test" })
vim.keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "Run test file" })
vim.keymap.set("n", "<leader>to", function() neotest.output_panel.toggle() end, { desc = "Toggle output panel" })
vim.keymap.set("n", "<leader>ts", function() neotest.summary.toggle() end, { desc = "Toggle summary panel" })
