
if exists('g:fvim_loaded')
	" good old 'set guifont' compatibility
	set guifont=JetBrainsMono\ NF:h16

	" Ctrl-ScrollWheel for zooming in/out
	nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
	nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>
	nnoremap <A-CR> :FVimToggleFullScreen<CR>

	"FVimCursorSmoothMove v:true
	"FVimCursorSmoothBlink v:true


	FVimFontAntialias v:true
	FVimFontAutohint v:true
	FVimFontHintLevel 'full'
	FVimFontLigature v:true
	"FVimFontLineHeight '+1.1' " can be 'default', '14.0', '-1.0' etc.
	FVimFontSubpixel v:true
	"FVimFontNoBuiltInSymbols v:true " Disable built-in Nerd font symbols
endif
