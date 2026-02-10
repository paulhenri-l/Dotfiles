local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- Ristretto
    -- {
    --   "loctvl842/monokai-pro.nvim",
    --   opts = {
    --     filter = "ristretto",
    --     override = function(c)
    --       return {
    --         -- reduce all whites
    --         Identifier = { fg = c.base.yellow }, -- variables
    --         ["@variable"] = { fg = "#d4c5a9" },
    --         ["@parameter"] = { fg = "#d4c5a9" },
    --         Function = { fg = c.base.green }, -- functions
    --         Property = { fg = c.base.orange }, -- JSON keys, object properties
    --         Field = { fg = c.base.orange }, -- struct/record fields
    --         Constant = { fg = c.base.purple }, -- numbers, true/false
    --         Type = { fg = c.base.blue }, -- types
    --         String = { fg = c.base.red }, -- strings
    --         Comment = { fg = c.base.gray }, -- comments, muted
    --
    --         -- Identifier = { fg = "#d4c5a9" }, -- warm muted beige
    --         -- ["@variable"] = { fg = "#d4c5a9" },
    --         -- ["@parameter"] = { fg = "#d4c5a9" },
    --       }
    --     end,
    --   },
    -- },
    -- { "LazyVim/LazyVim", import = "lazyvim.plugins", opts = { colorscheme = "monokai-pro" } },

    -- Gruvbox
    -- { "ellisonleao/gruvbox.nvim", priority = 1000, opts = { transparent_mode = true } },
    -- { "LazyVim/LazyVim", import = "lazyvim.plugins", opts = { colorscheme = "gruvbox" } },

    -- Everforest
    -- { "neanias/everforest-nvim" },
    -- { "LazyVim/LazyVim", import = "lazyvim.plugins", opts = { colorscheme = "everforest", background = "soft" } },

    -- Tokyonight
    { "LazyVim/LazyVim", import = "lazyvim.plugins", opts = { colorscheme = "tokyonight-moon", background = "soft" } },

    -- Kanagawa
    -- { "rebelot/kanagawa.nvim" },
    -- { "LazyVim/LazyVim", import = "lazyvim.plugins", opts = { colorscheme = "kanagawa-wave" } },

    -- Templates
    { "Shatur/neovim-ayu" },
    { "xiyaowong/transparent.nvim" },

    -- Disable default LazyVim plugins
    { "folke/flash.nvim", enabled = false },
    { "folke/noice.nvim", enabled = false },
    { "lukas-reineke/indent-blankline.nvim", enabled = false },
    { "akinsho/bufferline.nvim", enabled = false },

    -- LazyVim Extra
    { import = "lazyvim.plugins.extras.lang.terraform" },
    { import = "lazyvim.plugins.extras.util.gitui" },
    { import = "lazyvim.plugins.extras.editor.refactoring" },
    { import = "lazyvim.plugins.extras.editor.illuminate" },
    { import = "lazyvim.plugins.extras.lang.tailwind" },
    { import = "lazyvim.plugins.extras.util.project" },
    { import = "lazyvim.plugins.extras.ui.mini-indentscope" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.yaml" },
    { import = "lazyvim.plugins.extras.lang.astro" },
    { import = "lazyvim.plugins.extras.lang.ruby" },
    { import = "lazyvim.plugins.extras.lang.php" },

    -- Plugins
    { import = "plugins" },
  },

  defaults = { lazy = false, version = false },
  install = { colorscheme = { "tokyonight", "habamax", "ayu" } },
  checker = { enabled = false },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
