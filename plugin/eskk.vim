" vim:foldmethod=marker:fen:
scriptencoding utf-8

" See 'doc/eskk.txt'.

let g:eskk_version = str2nr(printf('%2d%02d%03d', 0, 1, 98))

" Load Once {{{
if exists('g:loaded_eskk') && g:loaded_eskk
    finish
endif
let g:loaded_eskk = 1
" }}}
" g:eskk_disable {{{
if !exists('g:eskk_disable')
    let g:eskk_disable = 0
endif
if g:eskk_disable
    finish
endif
" }}}
" Saving 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
" }}}

" Global Variables {{{

" Debug
if !exists('g:eskk_debug')
    let g:eskk_debug = 0
endif
if !exists('g:eskk_debug_wait_ms')
    let g:eskk_debug_wait_ms = 0
endif
if !exists('g:eskk_debug_profile')
    let g:eskk_debug_profile = 0
endif
if !exists('g:eskk_debug_profile_file')
    let g:eskk_debug_profile_file = expand('~/eskk-debug-profile.log')
endif

if g:eskk_debug_profile
    execute 'profile start' g:eskk_debug_profile_file
    for s:p in split(globpath(&rtp, 'plugin/eskk**') . globpath(&rtp, 'autoload/eskk**'), '\n')
        if filereadable(s:p)
            execute 'profile file' s:p
        endif
    endfor
    unlet s:p
endif

" Dictionary
if !exists("g:eskk_dictionary")
    let g:eskk_dictionary = "~/.skk-jisyo"
endif
if type(g:eskk_dictionary) == type("")
    let s:temp = g:eskk_dictionary
    unlet g:eskk_dictionary
    let g:eskk_dictionary = {
    \   'path': s:temp,
    \   'sorted': 0,
    \   'encoding': 'utf-8',
    \}
    unlet s:temp
elseif type(g:eskk_dictionary) != type({})
    call eskk#util#warn(
    \   "g:eskk_dictionary's type is either String or Dictionary."
    \)
endif


if !exists("g:eskk_large_dictionary")
    let g:eskk_large_dictionary = "/usr/local/share/skk/SKK-JISYO.L"
endif
if type(g:eskk_large_dictionary) == type("")
    let s:temp = g:eskk_large_dictionary
    unlet g:eskk_large_dictionary
    let g:eskk_large_dictionary = {
    \   'path': s:temp,
    \   'sorted': 1,
    \   'encoding': 'euc-jp',
    \}
    unlet s:temp
elseif type(g:eskk_large_dictionary) != type({})
    call eskk#util#warn(
    \   "g:eskk_large_dictionary's type is either String or Dictionary."
    \)
endif

if !exists("g:eskk_backup_dictionary")
    let g:eskk_backup_dictionary = g:eskk_dictionary.path . ".BAK"
endif
if !exists("g:eskk_auto_save_dictionary_at_exit")
    let g:eskk_auto_save_dictionary_at_exit = 1
endif

" Henkan
if !exists("eskk_select_cand_keys")
  let eskk_select_cand_keys = "asdfjkl"
endif

if !exists("eskk_show_candidates_count")
  let eskk_show_candidates_count = 4
endif

if !exists("eskk_kata_convert_to_hira_at_henkan")
  let eskk_kata_convert_to_hira_at_henkan = 1
endif

if !exists("eskk_show_annotation")
  let eskk_show_annotation = 0
endif

" Mappings
if !exists('g:eskk_no_default_mappings')
    let g:eskk_no_default_mappings = 0
endif
if !exists('g:eskk_dont_map_default_if_already_mapped')
    let g:eskk_dont_map_default_if_already_mapped = 1
endif

function! EskkDefaultMappedKeys() "{{{
    return split(
    \   'abcdefghijklmnopqrstuvwxyz'
    \  .'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    \  .'1234567890'
    \  .'!"#$%&''()'
    \  .',./;:]@[-^\'
    \  .'>?_+*}`{=~'
    \   ,
    \   '\zs'
    \) + [
    \   "<lt>",
    \   "<Bar>",
    \   "<Tab>",
    \   "<BS>",
    \   "<C-h>",
    \   "<CR>",
    \   "<Space>",
    \   "<C-q>",
    \]
endfunction "}}}
if !exists('g:eskk_mapped_key')
    let g:eskk_mapped_key = EskkDefaultMappedKeys()
endif

" Mode
if !exists('g:eskk_initial_mode')
    let g:eskk_initial_mode = 'hira'
endif

" Markers
if !exists("g:eskk_marker_henkan")
    let g:eskk_marker_henkan = '▽'
endif
if !exists("g:eskk_marker_okuri")
    let g:eskk_marker_okuri = '*'
endif
if !exists("g:eskk_marker_henkan_select")
    let g:eskk_marker_henkan_select = '▼'
endif
if !exists("g:eskk_marker_jisyo_touroku")
    let g:eskk_marker_jisyo_touroku = '?'
endif

" Misc.
if !exists("g:eskk_egg_like_newline")
    let g:eskk_egg_like_newline = 0
endif

if !exists("g:eskk_keep_state")
    let g:eskk_keep_state = 0
endif

if !exists("g:eskk_revert_henkan_style")
    let g:eskk_revert_henkan_style = 'eskk'
endif

if !exists("g:eskk_hira_input_style")
    let g:eskk_hira_input_style = 'skk'
endif

" }}}

" Mappings {{{

noremap! <expr> <Plug>(eskk:enable)     eskk#enable()
lnoremap <expr> <Plug>(eskk:enable)     eskk#enable()

noremap! <expr> <Plug>(eskk:disable)    eskk#disable()
lnoremap <expr> <Plug>(eskk:disable)    eskk#disable()

noremap! <expr> <Plug>(eskk:toggle)     eskk#toggle()
lnoremap <expr> <Plug>(eskk:toggle)     eskk#toggle()

nnoremap        <Plug>(eskk:save-dictionary) :<C-u>call eskk#mode#builtin#update_dictionary()<CR>

if !g:eskk_no_default_mappings
    function! s:do_map(rhs, mode)
        let map_default_even_if_already_mapped = !g:eskk_dont_map_default_if_already_mapped
        return
        \   map_default_even_if_already_mapped
        \   || !hasmapto(a:rhs, a:mode)
    endfunction

    if s:do_map('<Plug>(eskk:toggle)', 'i')
        silent! imap <unique> <C-j>   <Plug>(eskk:toggle)
    endif
    if s:do_map('<Plug>(eskk:toggle)', 'c')
        silent! cmap <unique> <C-j>   <Plug>(eskk:toggle)
    endif
    if s:do_map('<Plug>(eskk:toggle)', 'l')
        silent! lmap <unique> <C-j>   <Plug>(eskk:toggle)
    endif

    delfunc s:do_map
endif

" }}}

" Commands {{{

" :EskkMap {{{
command!
\   -nargs=+
\   EskkMap
\   call eskk#_cmd_eskk_map(<q-args>)
" }}}

" }}}


" Restore 'cpoptions' {{{
let &cpo = s:save_cpo
" }}}
