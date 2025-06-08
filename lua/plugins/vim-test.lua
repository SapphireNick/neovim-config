return {
	"vim-test/vim-test",
	dependencies = {
		"preservim/vimux",
	},
	config = function()
		vim.cmd("let test#strategy = 'vimux'")

		vim.keymap.set("n", "<leader>tt", ":TestNearest<CR>", {})
		vim.keymap.set("n", "<leader>tT", ":TestFile<CR>", {})
		vim.keymap.set("n", "<leader>ta", ":TestSuite<CR>", {})
		vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", {})
		vim.keymap.set("n", "<leader>tg", ":TestVisit<CR>", {})
	end,
}
