set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
" instead of having an init.lua
lua require('config')
source ~/.vimrc
" disable cursor shaping (make it square)
"
lua vim.cmd("set signcolumn=yes:1")
set guicursor=a:blinkon100
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

lua vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
lua vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
lua vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
lua vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
lua vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])
lua vim.cmd([[let g:terraform_fmt_on_save=1]])
lua vim.cmd([[let g:terraform_align=1]])
