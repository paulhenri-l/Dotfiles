-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = ","
vim.g.maplocalleader = ";"
vim.g.html_indent_inctags = "p"

vim.opt.backspace = "indent,eol,start"

-- Folds
function FoldText()
  local first_line = vim.fn.getline(vim.v.foldstart)
  local nucolwidth = vim.wo.foldcolumn + (vim.wo.number and vim.wo.numberwidth or 0)
  local windowwidth = vim.fn.winwidth(0) - nucolwidth - 3

  -- expand tabs into spaces for the first line
  local onetab = string.rep(" ", vim.o.tabstop)
  first_line = first_line:gsub("\t", onetab)

  -- Truncate the first line to fit the window width and add ellipsis
  local display_line = first_line:sub(1, windowwidth - 5) .. ""

  return display_line
end

vim.o.foldtext = "v:lua.FoldText()"
