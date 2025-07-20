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

			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,

			["lua_ls"] = function()
				-- configure lua server (with special settings)
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,

			["rust-analyzer"] = function()
				lspconfig["rust-analyzer"].setup({
					capabilities = capabilities,
					on_attach = function(client)
						require("completion").on_attach(client)
					end,
					settings = {
						["rust-analyzer"] = {
							imports = {
								granularity = {
									group = "module",
								},
								prefix = "self",
							},
							cargo = {
								buildScripts = {
									enable = true,
								},
							},
							procMacro = {
								enable = true,
							},
						},
					},
				})
			end,

			["tinymist"] = function()
				-- configure typst server (with special settings)
				lspconfig["tinymist"].setup({
					capabilities = capabilities,
					offset_encoding = "utf-8",
					settings = {
						formatterMode = "typstyle",
						tabSize = 4,
					},
				})
			end,
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
