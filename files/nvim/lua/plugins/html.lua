return {
  {
    "windwp/nvim-ts-autotag",
    event = "LazyFile",
    opts = {
      filetypes = { "html", "xml", "eruby", "embedded_template" },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "emmet-language-server",
      })
    end,
  },

  { "neovim/nvim-lspconfig", opts = { servers = { emmet_language_server = {} } } },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "embedded_template" })
      opts.autotag = { enable = true }
    end,
  },
}
