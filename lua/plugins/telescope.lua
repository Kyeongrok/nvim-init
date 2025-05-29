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

           -- 실시간 컬러셈 적용용 attach_mappings
           local function colorscheme_attach_mappings(prompt_bufnr, map)
             actions.move_selection_next:enhance {
               post = function()
                 local entry = action_state.get_selected_entry()
                 vim.cmd("colorscheme " .. entry.value)
               end,
             }

             actions.move_selection_previous:enhance {
               post = function()
                 local entry = action_state.get_selected_entry()
                 vim.cmd("colorscheme " .. entry.value)
               end,
             }

             return true
           end

            require('telescope').setup {
                defaults = {
                    path_display = { "tail", "smart" },  -- 파일명만 표시
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-d>"] = actions.results_scrolling_down,
                            ["<C-u>"] = actions.results_scrolling_up,
--                            ["<CR>"] = checkout_remote_branch
                        },
                        n = {
                            ["j"] = actions.move_selection_next,
                            ["k"] = actions.move_selection_previous,
                            ["<C-d>"] = actions.results_scrolling_down,
                            ["<C-u>"] = actions.results_scrolling_up,
--                            ["<CR>"] = checkout_remote_branch
                        },
                    },
                },
                pickers = {
                  colorscheme = { enable_preview = true, -- 이미 적용되는 설정일 수도 있음
                    attach_mappings = colorscheme_attach_mappings
                  },
                },
                layout_config = {
                    horizontal = {
                        preview_width = 0.8,  -- make the preview window take up the entire width
                        results_width = 0.01,  -- make the results window very narrow
                    },
                    vertical = {
                        preview_height = 1.0,  -- make the preview window take up the entire height
                        results_height = 0.05,  -- make the results window very narrow
                    },
                },
            }

            vim.api.nvim_set_keymap('n', '<leader>gr', [[:lua require('telescope.builtin').git_branches({ show_remote_tracking_branches = true })<CR>]], { noremap = true, silent = true })
        end,
    },
}
