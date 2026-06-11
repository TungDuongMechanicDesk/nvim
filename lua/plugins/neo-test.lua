return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "olimorris/neotest-rspec",
    "nvim-neotest/nvim-nio",
    "zidhuss/neotest-minitest",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-rspec")({
          rspec_cmd = function()
            return { "bundle", "exec", "rspec" }
          end,
        }),
        require("neotest-minitest")({
          test_cmd = function()
            return { "bundle", "exec", "rails", "test" }
          end,
        }),
      },
      status = { virtual_text = true, signs = true },
      output = { open_on_run = false },
    })

    local neotest = require("neotest")
    vim.keymap.set("n", "<leader>tt", function()
      neotest.run.run()
    end, { desc = "Run nearest test" })
    vim.keymap.set("n", "<leader>tf", function()
      neotest.run.run(vim.fn.expand("%"))
    end, { desc = "Run test file" })
    vim.keymap.set("n", "<leader>to", function()
      neotest.output_panel.toggle()
    end, { desc = "Toggle output panel" })
    vim.keymap.set("n", "<leader>ts", function()
      neotest.summary.toggle()
    end, { desc = "Toggle summary panel" })
  end,
}
