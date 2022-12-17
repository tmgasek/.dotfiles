local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end


-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover)
    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
    -- vim.keymap.set('n', '<a-k>', vim.lsp.buf.signature_help)
    -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder)
    -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder)
    -- vim.keymap.set('n', '<leader>wl', function()
    --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end)
    -- vim.keymap.set('n', '<leader>gT', vim.lsp.buf.type_definition)
    -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
    -- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references)
    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')
    nmap('<leader>f', function() vim.lsp.buf.format { async = true } end, '[F]ormat')

    -- Create a command `:Format` local to the LSP buffer
    -- WARNING: This was slow...
    -- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    --     if vim.lsp.buf.format then
    --         vim.lsp.buf.format()
    --     elseif vim.lsp.buf.formatting then
    --         vim.lsp.buf.formatting()
    --     end
    -- end, { desc = 'Format current buffer with LSP' })
end

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end


require('mason').setup()

local servers = {
    "cssls",
    "dockerls",
    "gopls",
    "html",
    "jsonls",
    "pyright",
    "rust_analyzer",
    "sumneko_lua",
    "tsserver",
    "yamlls",
    "rust_analyzer",
    "tailwindcss",
    "cssmodules_ls",
    "dockerls",
    "prismals",
    "astro",
}

require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true
})

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

vim.g.markdown_fenced_languages = {
    "ts=typescript"
}

lspconfig.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    root_dir = lspconfig.util.root_pattern("package.json"),
}
lspconfig.denols.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
}


lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
}
