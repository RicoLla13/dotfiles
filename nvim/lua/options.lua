-- Peripherals
vim.opt.clipboard = 'unnamedplus'
vim.opt.mouse = 'a'

-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Custom tab function
vim.api.nvim_create_augroup("CustomIndent", { clear = true })

local function set_indent(ft, opts)
  vim.api.nvim_create_autocmd("FileType", {
    group = "CustomIndent",
    pattern = ft,
    callback = function()
      for opt, val in pairs(opts) do
        vim.bo[opt] = val
      end
    end,
  })
end

set_indent("dart", { shiftwidth = 2, tabstop = 2, expandtab = true })


-- Auto-format on save for C++ and Dart files
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.c", "*.cpp", "*.h", "*.hpp", "*.dart" },  -- Matches C and C++ file extensions
    callback = function()
        vim.lsp.buf.format()  -- For Neovim 0.8+; use `formatting_sync()` for older versions
    end,
})

-- UI config
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.laststatus = 2
vim.opt.ruler = true
vim.opt.showmode = false

-- Searching
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
