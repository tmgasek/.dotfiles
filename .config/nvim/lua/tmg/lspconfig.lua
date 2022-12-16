local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end
local protocol = require('vim.lsp.protocol')

require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua", "rust_analyzer", "tsserver", "cssls", "gopls" },
    automatic_installation = true
})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<a-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>gT', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Auto format, needs ussed in on attach
local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
    vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup_format,
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
        end,
    })
end


local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
lspconfig.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    root_dir = lspconfig.util.root_pattern("package.json"),
}
--lspconfig.emmet_ls.setup {
--    on_attach = on_attach
--}
lspconfig.gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
lspconfig.cssls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
lspconfig.cssmodules_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
lspconfig.tailwindcss.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
lspconfig.dockerls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
lspconfig.yamlls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
lspconfig.intelephense.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
lspconfig.jsonls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
vim.g.markdown_fenced_languages = {
    "ts=typescript"
}
lspconfig.denols.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
}
lspconfig.prismals.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.astro.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
