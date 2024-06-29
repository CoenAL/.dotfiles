require('neo-tree').setup {
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    filesystem = {
        filtered_items = {
            visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
            hide_dotfiles = false,
            hide_gitignored = true,
        },
    },
    window = {
          position = "left",
          width = 25,
    },
}
