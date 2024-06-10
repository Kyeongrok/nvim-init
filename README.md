

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
