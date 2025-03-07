local is_windows = vim.loop.os_uname().version:match("Windows")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`



-- Spaces & Tabs {{{                
vim.opt.tabstop = 4       -- number of visual spaces per TAB    
vim.opt.softtabstop = 4   -- number of spaces in tab when editing    
vim.opt.shiftwidth = 4    -- number of spaces to use for autoindent      
vim.opt.expandtab = true  -- tabs are space    
vim.opt.autoindent = true                                                                                                               
vim.opt.copyindent = true -- copy indent from the previous line                               
vim.opt.termguicolors = true                                                                                                                               

vim.api.nvim_set_option('clipboard', 'unnamedplus')

vim.o.nu=true                                                                                                              
vim.o.mouse=a

local nvim_home = "~/AppData/local/nvim"
if is_windows then
  -- Windows에서의 키 매핑
  vim.api.nvim_set_keymap('n', '<F10>', ':e ~/AppData/local/nvim/init.lua<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<leader>se', ':e ~/AppData/local/nvim/init.lua<CR>', {noremap = true, silent = true})
else
  -- Linux에서의 키 매핑
  vim.api.nvim_set_keymap('n', '<F10>', ':e ~/.config/nvim/init.lua<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<F11>', ':e ~/.config/nvim/lua/plugins/nvim-cmp.lua<CR>', {noremap = true, silent = true})
end


-- Plug 플러그인 설치
vim.api.nvim_set_keymap('n', '<F8>', ':PlugInstall<CR>', {noremap = true})

-- 현재 파일 다시 읽기
vim.api.nvim_set_keymap('n', '<F12>', ':source %<CR>', {noremap = true})

-- 저장
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', {noremap = true})

-- 종료
vim.api.nvim_set_keymap('n', '<C-q>', ':q<CR>', {noremap = true})

-- WhichKey 플러그인 사용
vim.api.nvim_set_keymap('n', '<silent> <leader>', ":WhichKey '<Space>'<CR>", {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', {noremap = true})

-- Move Screen
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true})

vim.api.nvim_set_keymap('n', '<leader><leader>h', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader><leader>l', '<C-w>l', {noremap = true})



-- pwd
vim.api.nvim_set_keymap('n', '<leader>p', ':pwd<CR>', {noremap = true})

-- Buffer(Tab)
vim.o.hidden = true

vim.api.nvim_set_keymap('n', '<S-h>', ':bprevious<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<S-l>', ':bnext<CR>', {noremap = true})

--vim.api.nvim_set_keymap('n', '<leader>rr', ':term poetry run python ~/rs485-python/rs485_python/main.py<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>rc', ':belowright split | resize 10 | term gcc -o %<.o %;./%<.o<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>rr', ':term gcc %;./ff read<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>rr', ':!python %<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>rp', ':belowright split | resize 10 |!python %<CR>', {noremap = true})

-- vim.api.nvim_set_keymap('n', '<leader>rc', ':term poetry run python /root/git/rs485-python/rs485_python/Gpio.py<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>e', ':NERDTreeToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader><leader>', ':NERDTreeToggle<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>bd', ':bd<CR>', {noremap = true})

--------------------
-- Git
--------------------
vim.api.nvim_set_keymap('n', '<leader>g', ':G<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gc', ':Git commit<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gu', ':Git push<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gp', ':Git pull<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gd', ':Gdiff<C>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gl', ':G log<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gv', ':GV<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gb', ':lua require("telescope.builtin").git_branches()<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>u', ':Telescope colorscheme<CR>', {noremap = true})


------------
-- ESC 누르면 한글 설정
-- C:\tools 에 im-select.exe를 넣어주어야 합니다. 
------------

local input_source_ko = "412" -- 한글 입력기 (Microsoft IME)
local input_source_en = "409" -- 영어 입력기 (US Keyboard)
local input_source_toggle_key = "<S-Space>" -- 한영 전환 키
local im_select_path = "C:\\Users\\kyeongrok\\ConsoleApp1.exe" -- im-select.exe 위치

local function get_ime()
    return vim.fn.system(im_select_path)
end

local function set_ime(lang)
    vim.fn.system(im_select_path .." ".. lang)
end

local function toggle_input_sources()
    local current_ime = get_ime():gsub("%s+", "") -- 공백 제거
    if current_ime == input_source_ko then
        set_ime(input_source_en)
    else
        set_ime(input_source_ko)
    end
end

vim.keymap.set('i', input_source_toggle_key, toggle_input_sources, {silent=true})

-- c-]를 누르면 korean 입력기로 전환
vim.keymap.set("i", "<C-Space>", function()
    set_ime(input_source_ko)
    return "<C-Space>"
end, { expr = true, silent = true })

vim.keymap.set("i", "<c-]>", function()
    set_ime(input_source_ko)
    return "<C-]>"
end, { expr = true, silent = true })


-- Command-line 모드에서 Esc 누르면 영어 입력기로 변경
vim.keymap.set("c", "<Esc>", function()
    set_ime(input_source_en)
    return "<Esc>"
end, { expr = true, silent = true })

-- Normal 모드 진입 시 자동으로 영어 입력기로 변경
vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
        set_ime(input_source_en)
    end
})

--------------------
-- Calendar
--------------------
vim.api.nvim_set_keymap('n', '<leader>c', ':Calendar<CR>', {noremap = true})


--------------------
-- Telekasten
--------------------
vim.api.nvim_set_keymap('n', '<leader>z', ':Telekasten<CR>', {noremap = true})


--------------------
-- Mason
--------------------
vim.api.nvim_set_keymap('n', '<leader>m', ':Mason<CR>', {noremap = true})
--------------------
-- Lazy
--------------------
vim.api.nvim_set_keymap('n', '<leader>l', ':Lazy<CR>', {noremap = true})

--------------------
-- Telescope
--------------------
vim.api.nvim_set_keymap('n', '<leader>t', ':Telescope<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>f', ':Telescope<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>', {noremap = true})


--------------------
-- Telekasten
--------------------
vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")


--require("mason").setup()
--require("bufferline").setup()
--require('nvim-web-devicons').setup()
--require'nvim-web-devicons'.get_icons()

function ReloadConfig()
    vim.cmd('source ' .. vim.fn.expand('%:p'))
    print("Configuration reloaded!")
end


-- 명령어 정의
vim.api.nvim_create_user_command('ReloadConfig', ReloadConfig, {})

require("lazy").setup("plugins")

vim.cmd.colorscheme "catppuccin"

-- cmp설정 불러오기
--local cmp_config = require('config.nvim-cmp')
--cmp_config.setup()
