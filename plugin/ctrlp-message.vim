""
" @section Introduction, intro
" @stylized ctrlp-message
" @library
" @order intro version dicts functions exceptions layers api faq
" ctrlp-message is a ctrlp plugin to fuzzy find and yank message history.


""
" Open message history
command! CtrlPMessage call ctrlp#init(ctrlp#message#id())


