-- Mason Setup
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"pyright",
		"rust_analyzer",
		"lua_ls",
		"clangd",
		"marksman",
		"phpactor",
		-- "intelephense",
	},
})

local lspconfig = require("lspconfig")

-- Setup LSP servers with cmp autocompletion
require("mason-lspconfig").setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			capabilities = require("cmp_nvim_lsp").default_capabilities(), -- Enable LSP capabilities for nvim-cmp
		})
	end,

	-- Special handler for clangd
	["clangd"] = function()
		lspconfig.clangd.setup({
			cmd = { "clangd", "--background-index", "--clang-tidy", "--cross-file-rename" },
			filetypes = { "c", "cpp", "objc", "objcpp" },
			root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
			init_options = {
				clangdFileStatus = true,
			},
			on_attach = function(client, bufnr)
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				-- Keybindings for LSP-related features
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
			end,
		})
	end,
})

-- Omnisharp
lspconfig.omnisharp.setup({
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/omnisharp" },
    enable_roslyn_analyzers = true,
    organize_imports_on_format = true,
    enable_import_completion = true,
    root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"),
    settings = {
        FormattingOptions = {
            EnableEditorConfigSupport = true,
            OrganizeImports = true,
        },
    },
})

-- Setup mason-null-ls
-- require("mason-null-ls").setup({
-- 	ensure_installed = {
-- 		"prettier",
-- 		"eslint_d",
-- 		"black",
-- 		"stylua",
-- 		"phpcs",
-- 		"phpstan",
-- 		"psalm",
-- 		"clang-format",
-- 	},
-- 	automatic_installation = true,
-- })
--
-- local null_ls = require("null-ls")
--
-- null_ls.setup({
-- 	sources = {
-- 		-- Configure Prettier to use Neovim’s tab width
-- 		null_ls.builtins.formatting.prettier.with({
-- 			extra_args = { "--tab-width", tostring(vim.bo.tabstop) },
-- 		}),
--
-- 		-- Configure Stylua for Lua formatting, adjusting for Neovim's tab width
-- 		null_ls.builtins.formatting.stylua.with({
-- 			extra_args = { "--indent-width", tostring(vim.bo.tabstop) },
-- 		}),
--
-- 		-- Add Black for Python formatting
-- 		null_ls.builtins.formatting.black,
--
-- 		-- Add clang-format for C++ formatting, with 4 spaces indentation
-- 		null_ls.builtins.formatting.clang_format.with({
-- 			extra_args = {
-- 				"--style",
-- 				[[{
--                     BasedOnStyle: Google,
--                     IndentWidth: 4,
--                     AllowShortBlocksOnASingleLine: Empty,
--                     AllowShortCaseLabelsOnASingleLine: false,
--                     AllowShortIfStatementsOnASingleLine: false,
--                     AllowShortLoopsOnASingleLine: false,
--                     DerivePointerAlignment: false,
--                     PointerAlignment: Left,
--                 }]],
-- 			},
-- 		}),
--
-- 		-- PHP formatters and diagnostics
-- 		-- null_ls.builtins.diagnostics.phpcs.with({
-- 		-- 	extra_args = { "--standard=PSR12" },
-- 		-- }),
-- 		-- null_ls.builtins.diagnostics.phpstan,
-- 		-- null_ls.builtins.diagnostics.psalm,
-- 	},
-- })

-- nvim-cmp Setup for autocompletion
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			-- You can use other snippet engines here. LuaSnip is used in this example.
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(), -- Manually trigger completion
		["<C-e>"] = cmp.mapping.abort(), -- Close the completion window
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept the selected completion
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- LSP suggestions
		{ name = "luasnip" }, -- Snippet suggestions
	}, {
		{ name = "buffer" }, -- Buffer suggestions
		{ name = "path" }, -- Path suggestions
	}),
})

-- For command line completion
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

-- LuaSnip setup for snippet support
require("luasnip.loaders.from_vscode").lazy_load() -- Load VSCode-style snippets

-- local package_names = require("mason-registry").get_installed_package_names()
-- local file = io.open("mason_packages.lua", "w")
-- file:write("return " .. vim.inspect(package_names))
-- file:close()
