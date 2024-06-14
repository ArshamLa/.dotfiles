# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi


source "${ZINIT_HOME}/zinit.zsh"


zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::ansible
zinit snippet OMZP::yarn
zinit snippet OMZP::nvm
zinit snippet OMZP::npm
zinit snippet OMZP::node


autoload -Uz compinit && compinit

zinit cdreplay -q

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza $realpath'

# Create custom plugins directory for plugins not available in zinit
ZSH_PLUGINS_DIR="${XDG_DATA_HOME:-${HOME}/.local/share}/zsh-plugins"
if [ ! -d "$ZSH_PLUGINS_DIR" ]; then
   mkdir -p "$(dirname $ZSH_PLUGINS_DIR)"
fi

# Install All plugins 
if [ ! -f "$ZSH_PLUGINS_DIR/plugins/you-should-use/you-should-use.plugin.zsh" ]; then
    git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_PLUGINS_DIR/plugins/you-should-use
fi

source $ZSH_PLUGINS_DIR/plugins/you-should-use/you-should-use.plugin.zsh