return {
  {
    "mason-org/mason.nvim",
    opts = {},
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "gopls",
          "ts_ls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false, -- Disable third-party checking
            },
            telemetry = {
              enable = false,
            },
            single_file_support = true,
            autostart = true,
          },
        },
        capabilities = capabilities,
      })

      vim.lsp.config("pyright", {
        capabilities = capabilities,
      })

      vim.lsp.config("kotlin_language_server", {
        capabilities = capabilities,
        init_options = {
          storagePath = vim.fn.stdpath("data") .. "/kotlin-language-server",
          settings = {
            kotlin = {
              compiler = {
                jvm = {
                  target = "1.8"
                }
              }
            }
          }
        },
      })

      -- vim.api.nvim_create_autocmd("FileType", {
      --   pattern = "typescript",
      --   callback = function()
      --     vim.diagnostic.enable(true)
      --   end
      -- })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "kotlin",
        callback = function()
          -- vim.diagnostic.enable(false)
          vim.bo.shiftwidth = 4
          vim.bo.tabstop = 4
          vim.bo.softtabstop = 4
          vim.bo.expandtab = true
        end
      })

      vim.lsp.config("gopls", {
        capabilities = capabilities,
      })

      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
      })

      vim.lsp.config("jdtls", {
        capabilities = capabilities,
        root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
      })

      vim.lsp.enable("lua_ls")
      vim.lsp.enable("gopls")
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("pyright")
      vim.lsp.enable("kotlin_language_server")
      vim.lsp.enable("jdtls")

      vim.diagnostic.enable(true)
      vim.diagnostic.config({
        virtual_text = true,
        float = {
          source = true,
          border = "rounded",
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "●",
            [vim.diagnostic.severity.WARN] = "●",
            [vim.diagnostic.severity.HINT] = "●",
            [vim.diagnostic.severity.INFO] = "●",
          },
        },
      })

      -- delete global default keymaps
      vim.keymap.del({ "n", "v" }, "gra")
      vim.keymap.del("n", "grr")
      vim.keymap.del("n", "gri")

      -- custom keymaps
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
      vim.keymap.set("n", "gh", vim.lsp.buf.hover, {})

      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set('n', '<leader>rn', function()
        local current_word = vim.fn.expand("<cword>")
        vim.ui.input({ prompt = 'Rename: ', default = current_word }, function(input)
          if input and input ~= current_word then
            vim.lsp.buf.rename(input)
          end
        end)
      end)

      vim.keymap.set("n", "ge", vim.diagnostic.open_float, {})
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {
      hint_prefix = "",
      doc_lines = 0,
      toggle_key = "<C-x>",
      -- floating_window = false,
      -- hint_inline = function()
      --   return true
      -- end,
    },
  },
}
