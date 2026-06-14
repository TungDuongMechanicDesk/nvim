return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters = {
        rubocop = {
          command = "rubocop",
          args = function(self, ctx)
            return { "--auto-correct", "--format", "quiet", "--out", "/dev/null", "$FILENAME" }
          end,
          stdin = false,
        },
      },
      formatters_by_ft = {
        lua = { "stylua" },
        ruby = { "rubocop" },
      },
    })

    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local lines = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)
        local end_line = lines[1] or ""
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({ async = true, lsp_format = "fallback", range = range })
    end, { range = true })
  end,
}
