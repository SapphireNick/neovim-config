return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  lazy = false, -- neo-tree will lazily load itself
  opts = {},
  config = function()
    vim.keymap.set("n", "<leader>e", ":Neotree toggle reveal<CR>", {})
    vim.keymap.set("n", "<leader>nr", ":Neotree reveal<CR>", {})
    require("neo-tree").setup({
      window = {
        position = "left",
        width = 50, -- Default width
        mapping_options = {
          noremap = true,
          nowait = true,
        },
      },
    })
  end,
}
