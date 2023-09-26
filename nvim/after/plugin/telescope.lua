local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>.', builtin.find_files, {})
vim.keymap.set('n', 'ff', builtin.git_files, {})
vim.keymap.set('n', 'gr', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
