return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local gruvbox = require("gruvbox")
      local grey = "#555555"
      gruvbox.setup({
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = true,
        invert_tabline = false,
        invert_intend_guides = true,
        inverse = true,    -- invert background for search, diffs, statuslines and errors
        contrast = "hard", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {
          LspReferenceText = { bg = grey },
          LspReferenceRead = { bg = grey },
          LspReferenceWrite = { bg = grey },
        },
        dim_inactive = false,
        transparent_mode = false,
      })
      vim.o.background = 'light'
      vim.cmd.colorscheme("gruvbox")
    end
  },
}
