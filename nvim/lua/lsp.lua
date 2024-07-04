require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require('mason-lspconfig').setup({
    ensure_installed = {
        'pyright',
        'rust_analyzer',
        'lua_ls',
        'clangd',
        'marksman',
    },
})

-- Set up lspconfig
local lspconfig = require('lspconfig')

-- Use Mason to setup LSP servers with lspconfig
require('mason-lspconfig').setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    })
  end,
})

-- Setup treesitter
require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "c", "cpp", "rust", "python", "markdown",
        "bash", "json", "lua", "yaml", "html", "css",
        "javascript", "typescript", "tsx", "dockerfile", "toml"
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
