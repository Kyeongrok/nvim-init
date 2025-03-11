return {
  {
    "nvim-lua/plenary.nvim",  -- 플러그인 등록
    config = function()
      -- Neovim 시작 시 NERDTree 실행 및 포커스 이동
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.schedule(function()  -- Neovim이 완전히 로드된 후 실행
            if vim.fn.exists(":NERDTree") == 1 then
              vim.cmd("NERDTree | wincmd p")
            end
          end)
        end
      })

      -- NERDTree가 유일한 창이면 자동 종료
      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
          if vim.fn.winnr('$') == 1 and vim.b.NERDTree and vim.b.NERDTree.isTabTree then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":quit<CR>", true, true, true), "n", false)
          end
        end
      })
    end
  }
}

