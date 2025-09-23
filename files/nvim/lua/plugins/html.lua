return {
  {
    "windwp/nvim-ts-autotag",
    event = "LazyFile",
    opts = { "html", "xml", "eruby" },
  },

  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "emmet-language-server",
      })
    end,
  },

  { "neovim/nvim-lspconfig", opts = { servers = { emmet_language_server = {} } } },
}
