-- ~/.config/nvim/init.lua

-- https://neovim.io/doc/user/nvim.html#nvim-from-vim ,
vim.opt.runtimepath:prepend("~/.vim")
vim.opt.runtimepath:append("~/.vim/after")
vim.opt.packpath = vim.opt.runtimepath:get()
vim.cmd("source ~/.vimrc")

-- neovim built-in lsp with clangd for c,c++,
-- ~/.config/nvim/pack/nvim/start/nvim-lspconfig/lua/lspconfig/
require'lspconfig'.clangd.setup{}

-- ~/.config/nvim/pack/nvim/start/nvim-treesitter/lua/nvim-treesitter/
require'nvim-treesitter'.setup{}

-- symbol outline with neovim lsp or treesitter
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
