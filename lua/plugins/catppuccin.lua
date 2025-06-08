return { 
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  opts = {
    flavour = 'auto',
    background = {
      light = 'latte',
      dark = 'mocha',
    },
  },
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "catppuccin"
  end
}
