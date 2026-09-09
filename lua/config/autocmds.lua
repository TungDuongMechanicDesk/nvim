local function augroup(name)
  return vim.api.nvim_create_augroup("vim" .. name, { clear = true })
end

-- Ruby 2.1 Configuration
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("ruby_config"),
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
  group = augroup("ruby_tags"),
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
  group = augroup("highlight_yank"),
  callback = function()
    if vim.fn.has("nvim-0.13") == 1 then
      vim.hl.hl_op()
    else
      (vim.hl or vim.highlight).on_yank()
    end
  end,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("json_conceal"),
  pattern = { "json", "jsonc", "json5" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})
