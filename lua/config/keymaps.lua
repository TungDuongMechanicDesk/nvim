vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

vim.keymap.set("n", "<C-a>", "gg<S-v>G")

vim.keymap.set("n", "te", ":tabedit<Return>", { silent = true })

vim.keymap.set("n", "ss", ":split<Return><C-w>w", { silent = true })
vim.keymap.set("n", "sv", ":vsplit<Return><C-w>w", { silent = true })

vim.keymap.set("n", "<leader>", "<C-w>w")
vim.keymap.set("", "sh", "<C-w>h")
vim.keymap.set("", "sj", "<C-w>j")
vim.keymap.set("", "sk", "<C-w>k")
vim.keymap.set("", "sl", "<C-w>l")

vim.keymap.set("n", "<C-w><left>", "<C-w><")
vim.keymap.set("n", "<C-w><right>", "<C-w>>")
vim.keymap.set("n", "<C-w><up>", "<C-w>+")
vim.keymap.set("n", "<C-w><down>", "<C-w>-")

vim.keymap.set("n", "ft", ":tabnew ~/algo/template/")

vim.keymap.set("n", "F", vim.diagnostic.open_float)

vim.keymap.set('n', '<leader>tt', ':TestFile<CR>', { noremap = true, silent = true, desc = "Run Test File" })
