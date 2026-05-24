# Nice guide for this: https://thevaluable.dev/zsh-completion-guide-examples/
# Also check out zshcompsys(1)

# Completion options
unsetopt MENU_COMPLETE

# Load completion system
autoload -Uz compinit bashcompinit && compinit && bashcompinit

# Define completers - zshcompsys(1) under "CONTROL FUNCTIONS"
zstyle ':completion:*' completer _extensions _complete _approximate

# Cache completions
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/compcache"

# Setup completion menu
zstyle ':completion:*' menu select
# Don't skip completing an exact command if other completions exist
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' accept-exact false
# Show group names, messages, and warnings
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
# Split by groups
zstyle ':completion:*' group-name ''
# Order groups
zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands
# Colorize files and directories
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Fuzzy(ish) completion https://superuser.com/a/815317
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

# Expand "//" to "/", instead of "//" to "/*/"
zstyle ':completion:*' squeeze-slashes true

# Completion keybinds
zmodload zsh/complist
# Navigation binds
bindkey -M menuselect '^[[Z' reverse-menu-complete # <S-Tab>
bindkey -M menuselect '^N' menu-complete
bindkey -M menuselect '^P' reverse-menu-complete
bindkey -M menuselect '^F' forward-char
bindkey -M menuselect '^B' backward-char
# Toggle interactive mode
bindkey -M menuselect '^Xi' vi-insert
