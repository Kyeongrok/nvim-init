
return {
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup {
        log_level = "info",
        auto_session_suppress_dirs = { "~/", "~/Downloads", "/" }, -- 특정 디렉토리에서는 자동 저장 안 함
        bypass_session_save_file_types = { "nerdtree" } -- 🔥 NERDTree 세션에서 제외
      }
    end
  }
}

