# My dotfiles, managed using [chezmoi](https://chezmoi.io)

## Installation
- Install chezmoi and git using your preferred method.
- Copy or clone[¹](#note1) this git repository to ~/.local/share/chezmoi.
- Run `chezmoi apply`. Depending on what OS you are on, a script that will automatically
  install any required programs and dependencies will run.

### MacOS
The installation script will ask if you want to continue with the automatic installation.
If you already have the required programs installed, then you can skip this process.
The script will not ask to run again, no matter what you answer.

### OpenSUSE Tumbleweed
The installation script is currently unimplemented.

### Manual Installation/Anything else
- Automatic installation is not supported, although the config should copy over and work,
at least for linux. Maybe I'll add arch and/or fedora support down the line?
- If you want to install manually, here are the programs I need for a comfortable
work environment:
- Any OS
    - zoxide
    - fzf
    - eza
    - sk
    - ripgrep
    - mpv
    - chafa
    - yt-dlp
    - neovim
    - starship
    - git
    - cmake
    - node
    - pyenv
    - fastfetch
    - zsh-completions
    - winetricks
    - chezmoi
    - lazygit
    - fira-code
    - fira-code-nerd-font
    - mononoki
    - mononoki-nerd-font
    - wine
    - wezterm-nightly
    - firefox
    - vlc
    - qbittorrent
    - (inkscape?)
    - (krita?)
    - (gimp?)
    - (blender?)
    - (reaper?)
- MacOS
    - amethyst
    - textmate
    - mac-mouse-fix
    - raycast
    - stats
    - dozer
- Linux (May depend on distro!)
    - gnome
    - pop-shell
    - sddm
    - (kate?)

---

### Notes
*<a name="note1">¹</a> I haven't quite figured a good way to clone this private repository from the command line.
Maybe generating a ssh key before installing, but that seems obnoxious*
