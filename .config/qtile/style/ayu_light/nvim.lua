return {
  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = 'light'
      vim.cmd.colorscheme("ayu")
    end
  },
}
