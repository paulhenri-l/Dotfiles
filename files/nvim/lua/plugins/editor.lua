return {
  { "ahmedkhalf/project.nvim", opts = { manual_mode = false } },
  {
    "nvim-mini/mini.indentscope",
    opts = function(_, opts)
      opts.draw = { animation = require("mini.indentscope").gen_animation.none() }
    end,
  },

  -- Change defaults
  { "snacks.nvim", opts = { scroll = { enabled = false } } },
  { "neovim/nvim-lspconfig", opts = { inlay_hints = { enabled = false } } },

  -- Personnal Additions
  { "wakatime/vim-wakatime", lazy = false },
  { "tpope/vim-surround" },
  { "pechorin/any-jump.vim" },

  -- Code comments
  {
    "nvim-mini/mini.comment",
    opts = {
      mappings = {
        comment = "",
        textobject = "",
        comment_visual = "<leader>k",
        comment_line = "<leader>k",
      },
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
            local selected_idx = cmp.get_selected_item_idx()

            -- If user manually selected something, accept that
            if selected_idx and selected_idx > 1 then
              return cmp.accept()
            end

            -- Otherwise, find first non-AI item
            local items = cmp.get_items()
            if items then
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
      { "<Tab>", LazyVim.pick("buffers"), desc = "Switch Buffers" },
    },
  },
}
