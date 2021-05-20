# antigen stuff

source ~/.antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle command-not-found
antigen bundle vi-mode
antigen bundle extract
antigen bundle chrissicool/zsh-256color
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle rupa/z
antigen bundle unixorn/autoupdate-antigen.zshplugin

antigen theme melmi/baran themes/baran

antigen apply

bindkey '^ ' forward-word
# bindkey '^ ' autosuggest-accept

alias bat=batcat

source /usr/share/doc/fzf/examples/completion.zsh
source ~/.bash_aliases
