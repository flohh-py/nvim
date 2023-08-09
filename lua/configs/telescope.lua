require('telescope').setup {
    defaults = {
        file_ignore_patterns = {
            ".git/", ".cache", "%.o", "%.a", "%.out",
            "%.class", "%.pdf", "%.mkv", "%.mp4",
            "%.zip", "%.po"
        },
    },
    extensions = {
    }
}
-- config for fzf
-- require('telescope').setup {
--     extensions = {
--         fzf = {
--             fuzzy = true,
--             override_generic_sorter = true,
--             override_file_sorter = true,
--             case_mode = "smart_case",
--         }
--     }
-- }
-- require('telescope').load_extension('fzf')
