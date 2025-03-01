return {
  { "LazyVim/LazyVim", opts = { colorscheme = "everforest" } },
  { "neanias/everforest-nvim", version = false, lazy = false, priority = 1000 },

  -- Disable default LazyVim plugins
  { "folke/flash.nvim", enabled = false },
  { "folke/noice.nvim", enabled = false },
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  { "akinsho/bufferline.nvim", enabled = false },
  { "echasnovski/mini.comment", enabled = false },

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

  { "ahmedkhalf/project.nvim", opts = { manual_mode = false } },
  {
    "echasnovski/mini.indentscope",
    opts = function(_, opts)
      opts.draw = { animation = require("mini.indentscope").gen_animation.none() }
    end,
  },

  -- Personnal Additions
  { "tpope/vim-surround" },
  { "pechorin/any-jump.vim" },
  {
    "tpope/vim-commentary",
    keys = {
      { "<leader>k", "<cmd>Commentary<CR>", desc = "Comment Line", mode = "n" },
      { "<leader>k", ":'<,'>Commentary<CR>", desc = "Comment Line", mode = "x" },
    },
  },

  -- Autocomplete
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")

      table.insert(opts.sources, { name = "emoji" })

      opts.experimental.ghost_text = false

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<CR>"] = cmp.mapping(function(fallback)
          if not cmp.visible() then
            fallback()
            return
          end

          local entry = cmp.get_selected_entry()
          if entry and entry.source.name ~= "copilot" then
            cmp.confirm({ select = false })
          else
            -- Find and confirm the first non-Copilot entry
            local entries = cmp.get_entries()
            for _, e in ipairs(entries) do
              if e.source.name ~= "copilot" then
                cmp.confirm({ entry = e, select = false })
                return
              end
            end
            fallback()
          end
        end),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = not cmp.get_selected_entry() })
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },

  -- Tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    keys = {
      {
        "<leader>&",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
        end,
        desc = "Explorer NeoTree (Root Dir)",
      },
    },
  },

  -- Fuzzy search
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader><space>", false },
      { "œ", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
      { "\\", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
      { "K", LazyVim.pick("grep_string"), mode = "v", desc = "Selection (Root Dir)" },
    },
  },
}
