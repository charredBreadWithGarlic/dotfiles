return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",

		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		-- import install helper for other mason stuff
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"pyright",
				"hyprls",
				"intelephense",
				"clangd",
				"tinymist",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- formatters
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pretty-php", -- php formatter
				-- has to be installed using rustup "rustfmt", -- rust formatter

				-- linters
				"pylint", -- python linter
				"semgrep", -- php linter
				-- "snyk", -- rust formatter
				"cpplint",
			},
		})
	end,
}
