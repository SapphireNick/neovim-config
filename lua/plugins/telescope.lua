return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>qq", ":Telescope diagnostics<cr>", {})
      vim.keymap.set('n', '<leader>b', function()
        require('telescope.builtin').buffers({
          sort_mru = true,              -- Sort by most recently used
          ignore_current_buffer = true, -- Don't show current buffer in list
        })
      end, { desc = 'List buffers' })
    end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("harpoon")
		end,
	},
}
