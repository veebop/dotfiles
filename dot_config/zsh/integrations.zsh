# Initialize zoxide
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

# Initialize pyenv
if command -v pyenv &>/dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# Initialize frum, ruby version manager
if command -v frum &>/dev/null; then
  eval "$(frum init)"
fi

# Initialize asdf
if command -v asdf &>/dev/null; then
  . $(brew --prefix asdf)/libexec/asdf.sh
fi

# Initialize swiftly
test -f "${HOME}/.swiftly/env.sh" && . "${HOME}/.swiftly/env.sh"

# FZF integration
if command -v fzf &>/dev/null; then
  source <(fzf --zsh)
  # Re-add tab binding for zsh-autocomplete
  bindkey -M emacs '^I' menu-complete
fi

# Enable Keychain (https://www.funtoo.org/Funtoo:Keychain)
if command -v keychain &>/dev/null; then
  eval $(keychain --eval --quiet id_ed25519)
fi

# Wezterm shell integration
# For MacOS, it is included in the application bundle
if [ -f /Applications/Wezterm.app/Contents/Resources/wezterm.sh ]; then
  source "/Applications/WezTerm.app/Contents/Resources/wezterm.sh"
  # For others, we can use a copy
else
  source "${HOME}/.config/wezterm/shell-integration.sh"
fi

# Yazi wrapper from https://yazi-rs.github.io/docs/quick-start/
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}
