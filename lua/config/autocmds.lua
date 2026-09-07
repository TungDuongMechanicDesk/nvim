-- Ruby 2.1 Configuration
vim.api.nvim_create_autocmd("FileType", {
	pattern = "ruby",
	callback = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		vim.lsp.start({
			name = "solargraph",
			cmd = { "solargraph", "stdio" },
			capabilities = capabilities,
			init_options = {
				maxCompletions = 20,
			},
			settings = {
				solargraph = {
					diagnostics = true,
					completion = true,
				},
			},
		})
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.schedule(function()
			vim.keymap.set("n", "gf", function()
				local word = vim.fn.expand("<cword>")
				if word ~= "" then
					require("fzf-lua").tags({ search = word })
				else
					pcall(vim.cmd, "normal! gf")
				end
			end, { buffer = true, desc = "GF via Fzf-Lua Tags" })
		end)
	end,
})

-- Neovim Config
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    if vim.fn.has("nvim-0.13") == 1 then
      vim.hl.hl_op()
    else
      (vim.hl or vim.highlight).on_yank()
    end
  end,
})
