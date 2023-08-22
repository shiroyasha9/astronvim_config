local function organize_imports()
	local param = {
		command = '_typescript.organizeImports',
		arguments = { vim.api.nvim_buf_get_name(0) },
	}

	vim.lsp.buf.execute_command(param)
end

return {
	commands = {
		OrganizeImports = {
			organize_imports,
			description = 'Organize Imports',
		},
	},
}
