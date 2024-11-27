-- ~/.config/nvim/init.lua

-- https://neovim.io/doc/user/nvim.html#nvim-from-vim
-- source a modified ~/.vimrc2, do not source ~/.vimrc directly
-- to avoid loading vim-lsp together with neovim built-in lsp
-- do not install vim-lsp under `start`, or it will be loaded by neovim automatically
vim.opt.runtimepath:prepend("~/.vim")
vim.opt.runtimepath:append("~/.vim/after")
vim.opt.packpath = vim.opt.runtimepath:get()
vim.cmd("source ~/.vimrc2")

-- comment the vim-lsp settings in modified ~/.vimrc2,
-- "packadd! vim-lsp          " comment for neovim
-- "packadd! vim-lsp-settings " comment for neovim
-- "set tagfunc=lsp#tagfunc   " comment for neovim

-- ~/.config/nvim/pack/nvim/start/nvim-lspconfig/lua/lspconfig/
require'lspconfig'.clangd.setup{}

-- ~/.config/nvim/pack/nvim/start/nvim-treesitter/lua/nvim-treesitter/
require'nvim-treesitter'.setup{}

-- symbol outline for c,c++ with neovim lsp or treesitter
-- ~/.config/nvim/pack/nvim/start/aerial.nvim/lua/aerial/
require("aerial").setup({
  layout = {
    width = 30,
  },
  autojump = true,
})
-- leader key is backslash \ so use \a in normal mode
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle<CR>")

--
