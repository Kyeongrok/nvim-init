return{
{
    "nvim-treesitter/nvim-treesitter",
    enabled = function()
            return vim.fn.has("mac") ~= 1 and vim.g.nvim_treesitter_enabled == 1 -- mac이 아닐때 그리고 global에서 설정이 1일때만
    end,
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "sql", "python", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
 }
}
