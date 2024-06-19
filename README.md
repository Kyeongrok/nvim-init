

### Prerequisite

vim-plug설치

```
https://github.com/junegunn/vim-plug
```

## Windows PowerShell
```
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force

```


### .config/nvim 디렉토리만들기

```bash
mkdir ~/.config/nvim
```

### Windows nvim root

~/AppData/local/nvim/init.lua



### init.lua파일 리로드

```lua
function ReloadConfig()
    vim.cmd('source ' .. vim.fn.expand('%:p'))
    print("Configuration reloaded!")
end

-- 명령어 정의
vim.api.nvim_create_user_command('ReloadConfig', ReloadConfig, {})

```

```
:lua ReloadConfig()
```


### plugins.lua로 분리

1. lua 디렉토리리를 만듭니다.
2. lua/plugins.lua를 만듭니다.
3. init.lua에 다음과 같이 import합니다.

```lua
require("lazy").setup("plugins")

```


### LSP서버 참조 중지

#### 서버의 리소스를 많이 쓰기 때문에 꺼야 할 때가 있습니다.

nvim-lspconfig 설정 변경

```lua
{
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require('lspconfig')
        lspconfig.lua_ls.setup({})
      --  lspconfig.pylyzer.setup({}) -- 주석을 풀면 pylyzer가 활성화 됩니다.

    end
}
```
