## Aliases
# General aliases
alias type='type -a'
alias mkdir='mkdir -p'
alias grep='grep --color=auto'
alias ggrep='ggrep --color=auto'
alias nv="nvim"
alias lg="lazygit"

# Aliases for eza
if command -v eza &>/dev/null; then
  alias es="eza --icons=auto"
  alias esa="eza -a --icons=auto"
  alias e="eza -lha --icons=auto"
  alias eg="eza -lha --git --git-repos --icons=auto"
  alias et="eza --icons=auto --tree"
  alias etl="eza -lh --icons=auto --tree"
  alias eta="eza -lha --icons=auto --tree"
fi

# Chezmoi
alias ch="chezmoi"
alias chap="chezmoi apply"
alias chst="chezmoi status"
alias chd="chezmoi diff"
# Skim with ripgrep
alias skrg="sk --ansi -i -c 'rg --color=always --line-number \"{}\"'"
alias skrgu="sk --ansi -i -c 'rg --color=always --line-number -u \"{}\"'"
alias skrguu="sk --ansi -i -c 'rg --color=always --line-number -uu \"{}\"'"
alias skrguuu="sk --ansi -i -c 'rg --color=always --line-number -uuu \"{}\"'"
# this is fucking stupid
alias itllbeok="mpv https://www.youtube.com/watch\?v\=uH2Ns9Tewpo -vo tct --profile=sw-fast"
# Download YT videos/audio
alias yt-vid="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'" # Best quality video available
alias yt-aud="yt-dlp -x -f 'bestaudio[ext=m4a]' --embed-thumbnail" # Downloads audio only, in m4a, and embeds the video thumbnail as cover art
alias yt-1080="yt-dlp -f 'bestvideo[height<=1080][ext=mp4]+bestaudio/best[height<=1080][ext=m4a]'"

# Load more specific 'run-help' function from $fpath.
# https://github.com/belak/zsh-utils
(( $+aliases[run-help] )) && unalias run-help && autoload -Uz run-help
alias help=run-help
