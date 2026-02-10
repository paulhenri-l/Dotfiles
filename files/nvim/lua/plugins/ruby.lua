return {
  { "jlcrochet/vim-ruby", enabled = false },
  { "tpope/vim-rails" },
  { "RRethy/nvim-treesitter-endwise" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "ruby" })
      opts.endwise = { enable = true }
      opts.autotag = { enable = true }
      opts.indent = { enable = false }
    end,
  },

  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "solargraph", "erb-lint" })
    end,
  },

  { "neovim/nvim-lspconfig", opts = { servers = { solargraph = {} } } },

  {
    "stevearc/conform.nvim",
    opts = {
      log_level = vim.log.levels.DEBUG,
      formatters_by_ft = {
        ruby = { "rubocop" },
        eruby = { "erb-lint" },
      },
    },
  },
}
