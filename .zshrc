HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

eval "$(starship init zsh)"

# if [ "$(type zi)" = 'alias' ]; then
#     unalias zi
# fi


#eval "$(zoxide init zsh)"

if [ -f ~/.config/zsh/zinit.zsh ]; then
  source ~/.config/zsh/zinit.zsh
fi



if [ -f ~/.config/zsh/alias.zsh ]; then
  source ~/.config/zsh/alias.zsh
fi
