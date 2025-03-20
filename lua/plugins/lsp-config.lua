return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({})
			lspconfig.pyright.setup({})
			lspconfig.ast_grep.setup({})
			lspconfig.dartls.setup({
				-- Optional: Define how LSP should attach to buffers
				on_attach = function(client, bufnr)
					-- Custom on_attach function for keymaps, etc.
					-- (Assuming you already have one in your config)
				end,
				-- Optional: Capabilities to integrate with completion plugins like nvim-cmp
				capabilities = require("cmp_nvim_lsp").default_capabilities(),

				-- You can also add custom settings for the Dart Analysis Server:
				settings = {
					dart = {
						flutterOutline = true,
						closingLabels = true,
						outlineNotifications = true,
					},
				},
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
	{
		"akinsho/flutter-tools.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for improved input dialogs
		},
		config = function()
			require("flutter-tools").setup({
				widget_guides = {
					enabled = true,
				},
				closing_tags = {
					highlight = "ErrorMsg",
					prefix = "//",
					enabled = true,
				},
				lsp = {
					color = {
						enabled = true,
						background = true,
					},
					on_attach = function(client, bufnr)
						-- Your on_attach function for keybindings
					end,
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
				},
				decorations = {
					statusline = {
						app_version = true,
						device = true,
					},
				},
				dev_log = {
					enabled = true,
					open_cmd = "tabedit",
				},
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},
}
