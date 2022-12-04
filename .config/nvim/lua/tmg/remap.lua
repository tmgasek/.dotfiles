local nnoremap = require("tmg.keymap").nnoremap
local vnoremap = require("tmg.keymap").vnoremap
local inoremap = require("tmg.keymap").inoremap
local silent = { silent = true }

nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
nnoremap("<C-k>", "<cmd>cnext<CR>zz")
nnoremap("<C-j>", "<cmd>cprev<CR>zz")
nnoremap("<leader>k", "<cmd>lnext<CR>zz")
nnoremap("<leader>j", "<cmd>lprev<CR>zz")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")


-- Copilot
vim.cmd("imap <silent><script><expr> <C-y> copilot#Accept('<End>')")
vim.cmd("let g:copilot_no_tab_map = v:true")
vim.cmd("let g:copilot_assume_mapped = v:true")



-- Navigate buffers
nnoremap("<S-l>", "<cmd>bnext<CR>")
nnoremap("<S-h>", "<cmd>bprevious<CR>")


-- bruh moment
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- Telescope
nnoremap("<leader>pp",
    "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>")
nnoremap("<leader>pg", "<cmd>Telescope live_grep<cr>")
nnoremap("<C-p>", function()
    require('telescope.builtin').git_files()
end)
nnoremap("<Leader>pf", function()
    require('telescope.builtin').find_files()
end)
nnoremap("<leader>pw", function()
    require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end)
nnoremap("<leader>pb", function()
    require('telescope.builtin').buffers()
end)
nnoremap("<leader>vh", function()
    require('telescope.builtin').help_tags()
end)

-- Harpoon
nnoremap("<leader>a", function() require("harpoon.mark").add_file() end, silent)
nnoremap("<C-h>", function() require("harpoon.ui").toggle_quick_menu() end, silent)

nnoremap("<leader>1", function() require("harpoon.ui").nav_file(1) end, silent)
nnoremap("<leader>2", function() require("harpoon.ui").nav_file(2) end, silent)
nnoremap("<leader>3", function() require("harpoon.ui").nav_file(3) end, silent)
nnoremap("<leader>4", function() require("harpoon.ui").nav_file(4) end, silent)

-- Undo Tree
nnoremap("<leader>u", ":UndotreeShow<CR>")
