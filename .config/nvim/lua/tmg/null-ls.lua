local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({
			extra_args = {
			-- "--tab-width 4",
			-- "indent_size 4",
			-- "--tab-width: 4",
			-- "--tab-width=4",
			},
		}),
		formatting.black.with({ extra_args = { "--fast" } }),
		-- formatting.yapf,
		--diagnostics.eslint_d
	},
})