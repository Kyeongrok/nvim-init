return {
  -- FZF 플러그인 추가
  {
    'junegunn/fzf',
    build = function() vim.fn['fzf#install']() end
  },
  {
    'junegunn/fzf.vim',
    dependencies = { 'junegunn/fzf' }
  },
}
