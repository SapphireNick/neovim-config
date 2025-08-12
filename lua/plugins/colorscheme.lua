return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    opts = {
      styles = {
        comments = "italic",
        keywords = "bold",
        functions = "NONE",
        variables = "NONE",
      },
    },
  },
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 1000, -- ms
      set_dark_mode = function()
        require("onedarkpro").setup({
          theme = "onedark",
        })
        vim.o.background = "dark"
        vim.cmd.colorscheme("onedark")
      end,
      set_light_mode = function()
        require("onedarkpro").setup({
          theme = "onelight",
        })
        vim.o.background = "light"
        vim.cmd.colorscheme("onelight")
      end,
    },
    init = function()
      require("auto-dark-mode").init()
    end,
  },
}

