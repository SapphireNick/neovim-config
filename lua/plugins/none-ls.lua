return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,

        null_ls.builtins.completion.spell,

        null_ls.builtins.diagnostics.golangci_lint,
        require("none-ls.diagnostics.eslint_d"),
      },
    })

    -- format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        -- Only format if there's an LSP client attached that supports formatting
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        for _, client in ipairs(clients) do
          if client.server_capabilities.documentFormattingProvider then
            vim.lsp.buf.format({ async = false })
            break
          end
        end
      end,
    })
  end,

  -- manual format
  vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format buffer" }),
}
