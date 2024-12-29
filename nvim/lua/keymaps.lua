-- common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-- Set leader keymap
vim.g.mapleader = ' '

-----------------
-- Normal mode --
-----------------

-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Tabs
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Enter command input
vim.keymap.set('n', ';', ':', opts)

-- Telescope
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>gs', '<cmd>lua require("telescope.builtin").git_status()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>km', '<cmd>lua require("telescope.builtin").keymaps()<CR>', opts)

-- Nvimtree
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- Tagbar
vim.api.nvim_set_keymap('n', '<leader>t', ':TagbarToggle<CR>', opts)

-- Format code
vim.api.nvim_set_keymap("n", "<leader>fo", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })

-- Create an autocommand group for Go to Definition
vim.api.nvim_create_augroup('GoToDefinition', { clear = true })

-- PHP: Map 'gd' to PhpactorGoToDefinition for PHP files
vim.api.nvim_create_autocmd('FileType', {
  group = 'GoToDefinition',
  pattern = 'php',  -- Apply to PHP files
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', 'gd', ':PhpactorGotoDefinition<CR>', { noremap = true, silent = true })
  end
})

-- Cmake
vim.api.nvim_set_keymap('n', '<leader>cmb', ':CMakeBuild<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>cmg', ':CMakeGenerate<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>cmr', ':CMakeRun<CR>', { noremap = true })

