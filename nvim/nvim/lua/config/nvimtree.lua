require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
        highlight_opened_files = "none",
        root_folder_modifier = ":t",
    },
    filters = {
        dotfiles = true,
    },
    git = {
        enable = true,
        ignore = false,
    },
})
