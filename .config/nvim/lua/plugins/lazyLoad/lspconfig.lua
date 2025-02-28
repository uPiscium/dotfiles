return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"folke/neodev.nvim",
			config = function()
				require("neodev").setup({})
			end,
			ft = { "lua" },
		},
		{ "folke/neoconf.nvim" },
		{
			"williamboman/mason.nvim",
			event = "VeryLazy",
		},
		{
			"williamboman/mason-lspconfig.nvim",
			cmd = { "LspInstall", "LspUninstall" },
		},
		{
			"b0o/schemastore.nvim",
			ft = { "json", "yaml", "toml" },
		},
	},
	opts = {
		format = { timeout_ms = 50000 },
	},
	config = function()
		require("mason").setup({
			PATH = "append",
		})
		local mason_lsp = require("mason-lspconfig")
		local nvim_lsp = require("lspconfig")
		nvim_lsp.jdtls.setup({})

		local mason = require("mason")
		local mason_lsp = require("mason-lspconfig")

		mason_lsp.setup({
			ensure_installed = {
				"clangd",
				"docker_compose_language_service",
				"dockerls",
				"efm",
				"eslint",
				"glsl_analyzer",
				"jsonls",
				"lemminx",
				"lua_ls",
				"omnisharp_mono",
				"pyright",
				"ruff",
				"ruff_lsp",
				"taplo",
				"tinymist",
				"vimls",
				"yamlls",
			},
		})

		mason_lsp.setup_handlers({
			function(server_name)
				if server_name == "efm" then
					return
				end

				local default_opts = {
					capabilities = vim.tbl_deep_extend(
						"force",
						vim.lsp.protocol.make_client_capabilities(),
						require("cmp_nvim_lsp").default_capabilities()
					),
				}
				local opts = {}
				if server_name == "denols" then
					-- INFO: Neccessary for avoiding conflict with other js severs
					opts = {
						root_dir = nvim_lsp.util.root_pattern("deno.json"),
						init_options = {
							lint = true,
							unstable = true,
							suggest = {
								imports = {
									hosts = {
										["https://deno.land"] = true,
										["https://cdn.nest.land"] = true,
										["https://crux.land"] = true,
									},
								},
							},
						},
					}
				elseif server_name == "biome" then
					opts.single_file_support = false
				elseif server_name == "eslint" then
					opts.root_dir = nvim_lsp.util.root_pattern(".eslintrc.js", ".eslintrc.json", ".eslintrc")
				elseif server_name == "stylelint_lsp" then
					opts.filetypes = { "css", "scss", "less", "sass" } -- exclude javascript and typescript
				elseif server_name == "jsonls" then
					opts.settings = {
						json = {
							schemas = require("schemastore").json.schemas(),
							validate = true,
						},
					}
				elseif server_name == "yamlls" then
					opts.settings = {
						yaml = {
							schemaStore = {
								enable = true,
								url = "",
							},
							schemas = require("schemastore").yaml.schemas(),
						},
					}
				elseif server_name == "tinymist" then
					opts.settings = {
						exportPdf = "onType",
						formatterMode = "typstyle",
					}
				elseif server_name == "glsl_analyzer" then
					nvim_lsp.glsl_analyzer.setup{}
				end
				nvim_lsp[server_name].setup(vim.tbl_deep_extend("force", default_opts, opts))
			end,
		})

		local function on_list(options)
			vim.fn.setqflist({}, " ", options)
			vim.api.nvim_command("cfirst")
		end

		vim.lsp.buf.definition({ on_list = on_list })
		vim.lsp.buf.references(nil, { on_list = on_list })
		vim.diagnostic.config({
			virtual_text = {
				source = true,
			},
		})
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if not client then
					return
				end
				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true)
				end
			end,
		})
	end,
	event = "BufReadPre",
}
