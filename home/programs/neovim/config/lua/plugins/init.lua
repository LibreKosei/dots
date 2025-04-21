return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "elixir-tools/elixir-tools.nvim",
      version = "*",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
          local elixir = require("elixir")
          local elixirls = require("elixir.elixirls")

          elixir.setup {
            nextls = {enable = true},
            elixirls = {
              enable = true,
              settings = elixirls.settings {
                dialyzerEnabled = false,
                enableTestLenses = false,
                fetchdeps = false
              },
              on_attach = function(client, bufnr)
                vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
                vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
                vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
              end,
            },
            projectionist = {
              enable = true
            }
          }
        end,
        dependencies = {
          "nvim-lua/plenary.nvim",
        },
  },
    {
        "mfussenegger/nvim-jdtls",
    }

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
