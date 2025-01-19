-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--

-- Fix TreeSiter bug with ruby syntax
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  callback = function()
    vim.opt_local.indentkeys:remove(".")
    vim.opt_local.indentkeys:remove("0{")
    vim.opt_local.indentkeys:remove("0}")
    vim.opt_local.expandtab = true
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "eruby" },
  callback = function()
    vim.opt_local.wrap = false
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.tabstop = 8

    vim.g.eruby_default_subtype = "html"
    vim.g.ruby_indent_access_modifier_style = "indent"
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "go" },
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "<Leader>f", ":GoDef<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, "n", "<Leader>pf", "<C-o>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, "n", "<Leader>rr", ":GoRename<CR>", { noremap = true, silent = true })
  end,
})
