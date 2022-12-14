local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
    return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
    defaults = {
        mappings = {
            n = {
                ["q"] = actions.close
            },
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            },
        },
        -- layout_strategy = "flex",
    },
    extensions = {
        file_browser = {
            theme = "dropdown",
            -- disables netrw and use telescope-file-browser in its place
            initial_mode = "normal",
            hijack_netrw = true,
            hidden = true,
            respect_gitignore = false,
            grouped = true,
            layout_strategy = "flex",
            layout_config = {
                width = 0.9,
                height = 0.9,
                prompt_position = "top",
                -- preview_cutoff = 120,
                -- horizontal = {
                --     mirror = false,
                -- },
                -- vertical = {
                --     mirror = false,
                -- },
            },
            mappings = {
                -- your custom insert mode mappings
                ["i"] = {
                    ["<C-w>"] = function() vim.cmd('normal vbd') end,
                },
                ["n"] = {
                    -- your custom normal mode mappings
                    ["N"] = fb_actions.create,
                    ["-"] = fb_actions.goto_parent_dir,
                },
            },
        },
    },
}
telescope.load_extension("file_browser")
pcall(require('telescope').load_extension, 'fzf')



vim.keymap.set("n", "<leader>pv", function()
    telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
    })
end)
