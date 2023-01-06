vim.opt.background = "dark"
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_foreground = 'mix'
vim.g.gruvbox_material_enable_bold = 1
-- vim.g.gruvbox_invert_selection = '0'
vim.g.everforest_background = 'hard'

-- Default options:
require('kanagawa').setup({
    undercurl = true, -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true },
    specialReturn = true, -- special highlight for the return keyword
    specialException = true, -- special highlight for exception handling keywords
    transparent = false, -- do not set background color
    dimInactive = false, -- dim inactive window `:h hl-NormalNC`
    globalStatus = false, -- adjust window separators highlight for laststatus=3
    terminalColors = true, -- define vim.g.terminal_color_{0,17}
    colors = {},
    overrides = {},
    theme = "default" -- Load "default" theme or the experimental "light" theme
})

require 'colorizer'.setup()

vim.cmd("colorscheme gruvbox-material")
