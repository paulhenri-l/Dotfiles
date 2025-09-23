return {
  { "ahmedkhalf/project.nvim", opts = { manual_mode = false } },
  {
    "nvim-mini/mini.indentscope",
    opts = function(_, opts)
      opts.draw = { animation = require("mini.indentscope").gen_animation.none() }
    end,
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      -- transparent_background = true,
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        snacks = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
    specs = {
      {
        "akinsho/bufferline.nvim",
        optional = true,
        opts = function(_, opts)
          if (vim.g.colors_name or ""):find("catppuccin") then
            opts.highlights = require("catppuccin.groups.integrations.bufferline").get_theme()
          end
        end,
      },
    },
  },

  -- Change defaults
  { "snacks.nvim", opts = { scroll = { enabled = false } } },

  -- Personnal Additions
  { "wakatime/vim-wakatime", lazy = false },
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
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.keymap = opts.keymap or {}
      opts.keymap["<Tab>"] = {
        function(cmp)
          return cmp.accept()
        end,
        "snippet_forward",
        "fallback",
      }
      opts.keymap["<CR>"] = {
        function(cmp)
          if cmp.is_visible() then
            local items = cmp.get_items()
            if items then
              -- Find the first non-AI completion
              for i, item in ipairs(items) do
                if item.source_id ~= "copilot" and item.source_id ~= "codeium" then
                  return cmp.accept({ index = i })
                end
              end
            end
          end
          return false
        end,
        "fallback",
      }
      opts.keymap["<Esc>"] = {
        function(cmp)
          if cmp.is_visible() then
            cmp.hide()
            return true
          end
          return false
        end,
        "fallback",
      }
      return opts
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
