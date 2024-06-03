return {
  { "tpope/vim-rails" },
  { "RRethy/nvim-treesitter-endwise" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "ruby" })
      opts.endwise = { enable = true }
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "ruby-lsp", "solargraph" })
    end,
  },

  { "neovim/nvim-lspconfig", opts = { servers = {
    solargraph = {},
    ruby_lsp = {},
  } } },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ruby = { "rubocop" },
      },
    },
  },
}
