set clipboard+=unnamedplus
" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'wakatime/vim-wakatime'

" List ends here. Plugins become visible to Vim after this call.
  " LSP Support
  Plug 'neovim/nvim-lspconfig'             " Required
  Plug 'williamboman/mason.nvim'           " Optional
  Plug 'williamboman/mason-lspconfig.nvim' " Optional

  " Autocompletion
  Plug 'hrsh7th/nvim-cmp'         " Required
  Plug 'hrsh7th/cmp-nvim-lsp'     " Required
  Plug 'L3MON4D3/LuaSnip'         " Required

  Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}
call plug#end()


lua <<EOF
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

-- " (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
EOF
