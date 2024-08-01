local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    'm4xshen/autoclose.nvim',
    'marko-cerovac/material.nvim',
    "nvim-treesitter/nvim-treesitter",

    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},

    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    'mfussenegger/nvim-dap',
    'leoluz/nvim-dap-go',
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
    { "folke/neodev.nvim", opts = {} }
})

require('colorscheme')
require('editor')
require('keymaps')
require('treesitter')
require('lspzero')
require('telescope-config')
require('lualine-config')
require('autoclose-config')
require('dap-go').setup()

require("neodev").setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
})


