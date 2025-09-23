-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Open the vimrc file
vim.api.nvim_set_keymap("n", "<Leader>ev", ":tabedit $MYVIMRC<CR>", { noremap = true, silent = true })

-- No highlight search
vim.api.nvim_set_keymap("n", "<Leader><Space>", ":nohlsearch<CR>", { noremap = true, silent = true })

-- Disable arrow keys
vim.api.nvim_set_keymap("n", "<Up>", "<NOP>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Down>", "<NOP>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Left>", "<NOP>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Right>", "<NOP>", { noremap = true, silent = true })

-- Open a new tab
vim.api.nvim_set_keymap("n", "<Leader>nt", ":tabnew<CR>", { noremap = true, silent = true })

-- Split pane navigation
vim.api.nvim_set_keymap("n", "<Leader>np", ":vsp<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>nP", ":sp<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gpj", "<C-W><C-J>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gpk", "<C-W><C-K>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gph", "<C-W><C-H>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gpl", "<C-W><C-L>", { noremap = true, silent = true })

-- Buffer navigation
vim.api.nvim_set_keymap("n", "<Tab>", ":bu#<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "d<Tab>", ":bd<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "D<Tab>", ":bufdo bd<CR>", { noremap = true, silent = true })

-- Resize panes with shift + up/down/left/right
vim.api.nvim_set_keymap("n", "<S-Left>", "<C-w><", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Up>", "<C-W>-", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Down>", "<C-W>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Right>", "<C-w>>", { noremap = true, silent = true })

-- Auto change directory to match current file
vim.api.nvim_set_keymap("n", "<Leader>cd", ":cd %:p:h<CR>:pwd<CR>", { noremap = true, silent = true })

-- Tags
vim.api.nvim_set_keymap("n", "<Leader>f", "<C-]>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>F", ":tag", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>pf", "<C-T>", { noremap = true, silent = true })

-- Sort selected text
vim.api.nvim_set_keymap(
  "v",
  "<Leader>su",
  "! awk '{ print length(), $0 | \"sort -n | cut -d\\  -f2-\" }'<CR>",
  { noremap = true, silent = true }
)

-- Move lines up and down in visual mode
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
