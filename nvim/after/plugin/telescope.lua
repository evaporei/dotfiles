local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>pf', builtin.git_files, {})

-- function string.starts(string, start)
--    return string.sub(string, 1, string.len(start)) == start
-- end

-- vim.keymap.set('n', '<C-f>', function()
--     local input = vim.fn.input("🔎 ")
--     -- if string.starts(input, '"') then
--     --     local end_idx = string.find(input, '"', 2)
--     --     local search = string.sub(input, 2, end_idx - 1)
--     --     local search_dirs = string.sub(input, end_idx + 2, -1)
--     --     -- print(search_dirs)
--     --     search_dirs = search_dirs .. ','
--     --     local search_dirs_t = {}
--     --     for w in search_dirs:gmatch("(.-) ") do
--     --         table.insert(search_dirs_t, w)
--     --     end
--     --     -- print(search_dirs_t)
--     --     builtin.grep_string({ search = search, search_dirs = search_dirs_t })
--     -- else
--         builtin.grep_string({ search = input })
--     -- end
-- end)

-- noremap <C-F> :Ag!<space>
vim.keymap.set('n', '<C-f>', function()
    local input = vim.fn.input("🔎 ")
    builtin.grep_string({ search = input })
end)
