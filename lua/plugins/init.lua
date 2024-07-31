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
    {"preservim/nerdtree"},
    {"tpope/vim-surround"},
    {'nvim-tree/nvim-web-devicons'},
    {
        'akinsho/bufferline.nvim', version = "*", 
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
        require("bufferline").setup{}
        end,
    },
    {
        'mg979/vim-visual-multi'
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
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
