local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[f]ind [f]iles in current project' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[f]ind by [g]rep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[f]ind open [b]uffer' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[f]ind in [h]elp doc' })
vim.keymap.set('n', '<leader>/', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in currentbuffer' })
