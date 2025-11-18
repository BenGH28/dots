return {
  {
    "dracula/vim",
    name = "dracula",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("dracula")
    end
  },
}
