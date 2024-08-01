local map = vim.api.nvim_set_keymap
local silent = { silent = true, noremap = true }

local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- use space as a map leader
map("", "<Space>", "<Nop>", silent)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- fast save
map('n', '<leader>s', ':w<CR>')

