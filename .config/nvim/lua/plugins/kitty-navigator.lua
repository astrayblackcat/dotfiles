return {
    {
        "knubie/vim-kitty-navigator",
        build = {
            "cp ./*.py ~/.config/kitty",
        },
        keys = {
            { '<C-h>', ':KittyNavigateLeft <CR>', { noremap = true, silent = true } },
            { '<C-j>', ':KittyNavigateDown <CR>', { noremap = true, silent = true } },
            { '<C-k>', ':KittyNavigateUp <CR>', { noremap = true, silent = true } },
            { '<C-l>', ':KittyNavigateRight <CR>', { noremap = true, silent = true } },
        }
    }
}
