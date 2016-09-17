# antigen stuff

source antigen.zsh

antigen use oh-my-zsh

antigen bundle command-not-found
antigen bundle vi-mode
antigen bundle extract
antigen bundle chrissicool/zsh-256color
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle rupa/z

antigen theme eastwood

antigen apply

###

bindkey '^ ' forward-word
# bindkey '^ ' autosuggest-accept

source .bash_aliases
