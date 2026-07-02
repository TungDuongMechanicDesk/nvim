return {
	{
		"lifepillar/vim-solarized8",
		branch = "neovim",
		config = function()
			-- vim.cmd([[ colorscheme solarized8 ]])
		end,
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
    config = function()
      vim.cmd([[ colorscheme solarized-osaka ]])
    end
	},
}
