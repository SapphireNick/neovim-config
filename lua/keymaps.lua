local function toggle_tab_bar()
	local barstatus = vim.api.nvim_eval("&showtabline")
	if barstatus < 2 then
		vim.opt.showtabline = 2
	else
		vim.opt.showtabline = 0
	end
end

vim.g.mapleader = " "
vim.keymap.set('n', '<leader><leader>', ':noh<CR>', { silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Moves the selection one line up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Moves the selection one line down" })

vim.keymap.set("v", "H", "<gv", { desc = "Dedents selection" })
vim.keymap.set("v", "L", ">gv", { desc = "Indents selection" })

-- Copying and pasting
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy into the system register" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from the system register" })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { desc = "Prepend paste from the system register" })

-- Tabs
vim.keymap.set("n", "<leader>tm", vim.cmd.tabnew, { desc = "Open a new tab" })
vim.keymap.set("n", "<leader>tn", vim.cmd.tabn, { desc = "Move to the next tab" })
vim.keymap.set("n", "<leader>tp", vim.cmd.tabp, { desc = "Move to the previous tab" })
vim.keymap.set("n", "<leader>tb", toggle_tab_bar, { desc = "Toggle tab bar visibility" })
