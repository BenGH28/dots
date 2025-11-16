return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require "core.ui.gruv"
      vim.o.background = "dark"
      vim.cmd.colorscheme("gruvbox")
    end
  },
}
