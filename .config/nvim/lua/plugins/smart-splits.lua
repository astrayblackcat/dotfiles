return {
    {
        "mrjones2014/smart-splits.nvim", lazy = false,
        build = './kitty/install-kittens.bash',
        keys = {
            { "<C-h>", function() require('smart-splits').move_cursor_left() end, },
            { "<C-j>", function() require('smart-splits').move_cursor_down() end, },
            { "<C-k>", function() require('smart-splits').move_cursor_up() end, },
            { "<C-l>", function() require('smart-splits').move_cursor_right() end, },

            { "<C-Up>", function() require('smart-splits').resize_up() end, },
            { "<C-Down>", function() require('smart-splits').resize_down() end, },
            { "<C-Left>", function() require('smart-splits').resize_left() end, },
            { "<C-Right>", function() require('smart-splits').resize_right() end, },
        },
        opts = {
            ignored_buftypes = {
                'neo-tree',
            },
            ignored_filetypes = {
                'neo-tree',
            },
            at_edge = 'stop',
        },
    }
}
