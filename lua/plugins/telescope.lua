return{
    {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local actions = require('telescope.actions')
            local action_state = require('telescope.actions.state')

            -- Custom function to checkout to the selected remote branch
            local function checkout_remote_branch(prompt_bufnr)

                local selection = action_state.get_selected_entry(prompt_bufnr)
                actions.close(prompt_bufnr)
                local branch = selection.value
                local local_branch = branch:gsub("origin/", "")
                vim.fn.system({'git', 'checkout', '-b', local_branch, branch})
                print('Checked out to ' .. local_branch)
            end

            require('telescope').setup {
                defaults = {
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-d>"] = actions.results_scrolling_down,
                            ["<C-u>"] = actions.results_scrolling_up,
                            ["<CR>"] = checkout_remote_branch
                        },
                        n = {
                            ["j"] = actions.move_selection_next,
                            ["k"] = actions.move_selection_previous,
                            ["<C-d>"] = actions.results_scrolling_down,
                            ["<C-u>"] = actions.results_scrolling_up,
                            ["<CR>"] = checkout_remote_branch
                        },
                    },
                },
                layout_config = {
                    horizontal = {
                        preview_width = 1.0,  -- make the preview window take up the entire width
                        results_width = 0.01,  -- make the results window very narrow
                    },
                    vertical = {
                        preview_height = 1.0,  -- make the preview window take up the entire height
                        results_height = 0.01,  -- make the results window very narrow
                    },
                },
            }

            vim.api.nvim_set_keymap('n', '<leader>gr', [[:lua require('telescope.builtin').git_branches({ show_remote_tracking_branches = true })<CR>]], { noremap = true, silent = true })
        end,
    },
}
