return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-cmdline",
	},
	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"pyright",
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({ capabilities = capabilities })
				end,

				["pyright"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.pyright.setup({
						-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#pyright
						cmd = { "pyright-langserver", "--stdio" },
						filetypes = { "python" },
						settings = {
							python = {
								analysis = {
									autoSearchPaths = true,
									useLibraryCodeForTypes = true,
									diagnosticMode = "openFilesOnly",
								},
							},
						},
					})
				end,
			},
		})

		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_signature_help" },
			}, {
				{ name = "buffer" },
			}),
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
			matching = { disallow_symbol_nonprefix_matching = false },
		})

		vim.diagnostic.config({
			virtual_text = true,
		})
	end,
}
