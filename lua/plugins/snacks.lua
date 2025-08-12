return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    input = { enabled = true },
    dashboard = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  gitbrowse = {
    enabled = true,
    notify = true,
  },
  terminal = {
    enabled = true,
    win = {

      position = "bottom",
      height = 15,
      border = "rounded",
      title = "Terminal",
      title_pos = "center",
    }
  },
  -- Floating windows for previews
  win = {
    enabled = true,
    keys = {
      q = "close",
      ["<esc>"] = "close",
    },
    -- Better styling for preview windows
    backdrop = {
      transparent = false,
      blend = 60
    }
  },
  config = function()
    require("snacks").setup({
      input = { enabled = true }
    })

    vim.keymap.set("n", "<C-=>", function() Snacks.terminal() end, {})
  end
}
