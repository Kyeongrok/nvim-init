if vim == nil then
    vim = require('vim')
end
return {
    {"folke/which-key.nvim"},
    {"junegunn/gv.vim"},
    {"folke/neoconf.nvim", cmd = "Neoconf" },
    {"folke/neodev.nvim"},
    {"tpope/vim-fugitive"},
    {"nvim-lua/plenary.nvim"},
    {"tpope/vim-surround"},
    {'nvim-tree/nvim-web-devicons'},
    {
        'akinsho/bufferline.nvim', version = "*", 
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup{
                options = {
                    themable = true,
                    indicator = {
                        icon = '▎', -- this should be omitted if indicator style is not 'icon'
                        style = 'underline'
                    },
                    always_show_bufferline = true,
                    show_close_icon = false,
                    --separator_style = "slant",
                    diagnostics = "nvim_lsp",
                    -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
                    diagnostics_indicator = function(count, level, diagnostics_dict, context)
                        return "("..count..")"
                    end,
                }
            }
        end,
    },
    {"mg979/vim-visual-multi"},
    {"catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },

        config = function()
            require('lualine').setup {
              options = { fmt = string.lower },
              sections = { lualine_a = {
                { 'mode', fmt = function(str) return str:sub(1,1) end } },
                          lualine_b = {'branch'} }
            }
        end,
    }


}
