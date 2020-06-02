" vim:foldmethod=marker:fen:sw=4
scriptencoding utf-8


" Saving 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
" }}}


function! eskk#table#rom_to_zenei#load() abort
  return {
        \   ' ': ['　', ''],
        \   '!': ['！', ''],
        \   '"': ['”', ''],
        \   '#': ['＃', ''],
        \   '$': ['＄', ''],
        \   '%': ['％', ''],
        \   '&': ['＆', ''],
        \   "'": ['’', ''],
        \   '(': ['（', ''],
        \   ')': ['）', ''],
        \   '*': ['＊', ''],
        \   '+': ['＋', ''],
        \   ',': ['，', ''],
        \   '-': ['ー', ''],
        \   '.': ['．', ''],
        \   '/': ['／', ''],
        \   '0': ['０', ''],
        \   '1': ['１', ''],
        \   '2': ['２', ''],
        \   '3': ['３', ''],
        \   '4': ['４', ''],
        \   '5': ['５', ''],
        \   '6': ['６', ''],
        \   '7': ['７', ''],
        \   '8': ['８', ''],
        \   '9': ['９', ''],
        \   ':': ['：', ''],
        \   ';': ['；', ''],
        \   '<': ['＜', ''],
        \   '=': ['＝', ''],
        \   '>': ['＞', ''],
        \   '?': ['？', ''],
        \   '@': ['＠', ''],
        \   'A': ['Ａ', ''],
        \   'B': ['Ｂ', ''],
        \   'C': ['Ｃ', ''],
        \   'D': ['Ｄ', ''],
        \   'E': ['Ｅ', ''],
        \   'F': ['Ｆ', ''],
        \   'G': ['Ｇ', ''],
        \   'H': ['Ｈ', ''],
        \   'I': ['Ｉ', ''],
        \   'J': ['Ｊ', ''],
        \   'K': ['Ｋ', ''],
        \   'L': ['Ｌ', ''],
        \   'M': ['Ｍ', ''],
        \   'N': ['Ｎ', ''],
        \   'O': ['Ｏ', ''],
        \   'P': ['Ｐ', ''],
        \   'Q': ['Ｑ', ''],
        \   'R': ['Ｒ', ''],
        \   'S': ['Ｓ', ''],
        \   'T': ['Ｔ', ''],
        \   'U': ['Ｕ', ''],
        \   'V': ['Ｖ', ''],
        \   'W': ['Ｗ', ''],
        \   'X': ['Ｘ', ''],
        \   'Y': ['Ｙ', ''],
        \   'Z': ['Ｚ', ''],
        \   '[': ['［', ''],
        \   '\': ['\', ''],
        \   ']': ['］', ''],
        \   '^': ['＾', ''],
        \   '_': ['＿', ''],
        \   '`': ['‘', ''],
        \   'a': ['ａ', ''],
        \   'b': ['ｂ', ''],
        \   'c': ['ｃ', ''],
        \   'd': ['ｄ', ''],
        \   'e': ['ｅ', ''],
        \   'f': ['ｆ', ''],
        \   'g': ['ｇ', ''],
        \   'h': ['ｈ', ''],
        \   'i': ['ｉ', ''],
        \   'j': ['ｊ', ''],
        \   'k': ['ｋ', ''],
        \   'l': ['ｌ', ''],
        \   'm': ['ｍ', ''],
        \   'n': ['ｎ', ''],
        \   'o': ['ｏ', ''],
        \   'p': ['ｐ', ''],
        \   'q': ['ｑ', ''],
        \   'r': ['ｒ', ''],
        \   's': ['ｓ', ''],
        \   't': ['ｔ', ''],
        \   'u': ['ｕ', ''],
        \   'v': ['ｖ', ''],
        \   'w': ['ｗ', ''],
        \   'x': ['ｘ', ''],
        \   'y': ['ｙ', ''],
        \   'z': ['ｚ', ''],
        \   '{': ['｛', ''],
        \   '|': ['｜', ''],
        \   '}': ['｝', ''],
        \   '~': ['～', ''],
        \}
endfunction


" Restore 'cpoptions' {{{
let &cpo = s:save_cpo
" }}}
