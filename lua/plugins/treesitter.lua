return{
{
    "nvim-treesitter/nvim-treesitter",
    enabled = function()
      return vim.fn.has("mac") ~= 1  -- Mac이 아닐 때만 활성화
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
