# My dotfiles, managed using [chezmoi](https://chezmoi.io/)

Feel free to use this as inspiration! I wouldn't recommend using it as is since
it will change often and possibly drastically.

*Please ignore the stupid jokes I have laying around in here :)*

## Installation
- Install [chezmoi](https://chezmoi.io/) and [git](https://git-scm.com/) using your preferred method.
- Copy or clone this git repository to ~/.local/share/chezmoi.
- Run `chezmoi apply`. If you are on a supported OS, a script will run
that will install programs I like to use. If you are on a unsupported OS,
take a look at [Manual Installation](#other-osmanual-installation)

### MacOS
The installation script will ask if you want to continue with the automatic installation.
If you already have the required programs installed, then you can skip this process.
The script will not ask to run again[¹](#note1).

### OpenSUSE Tumbleweed
This script is not thoroughly tested, but I haven't run into many errors using it.
The installation script will ask if you want to continue with the automatic installation.
If you already have the required programs installed, then you can skip this process.
The script will not ask to run again[¹](#note1).

## Programs:
Here some programs I regularly use:
- Any OS
    - [chafa](https://hpjansson.org/chafa/)
    - [chezmoi](https://chezmoi.io/)
    - [cmake](https://cmake.org/)
    - [eza](https://eza.rocks)
    - [fastfetch](https://github.com/fastfetch-cli/fastfetch)
    - [fira-code-nerd-font](https://www.nerdfonts.com/)
    - [fira-code](https://github.com/tonsky/FiraCode)
    - [firefox](https://www.mozilla.org/en-US/firefox/)
    - [fzf](https://github.com/junegunn/fzf)
    - [git](https://git-scm.com/)
    - [lazygit](https://github.com/jesseduffield/lazygit)
    - [mononoki-nerd-font](https://www.nerdfonts.com/)
    - [mononoki](http://madmalik.github.io/mononoki/)
    - [mpv](https://mpv.io/)
    - [neovim](https://neovim.io/)
    - [node](https://nodejs.org/en)
    - [pyenv](https://github.com/pyenv/pyenv)
    - [qbittorrent](https://github.com/qbittorrent/qBittorrent)
    - [ripgrep](https://github.com/BurntSushi/ripgrep)
    - [sk](https://github.com/lotabout/skim)
    - [starship](https://starship.rs/)
    - [vlc](http://www.videolan.org/vlc/)
    - [wezterm](https://wezfurlong.org/wezterm/)
    - [wine](https://www.winehq.org/)
    - [winetricks](https://github.com/Winetricks/winetricks)
    - [yt-dlp](https://github.com/yt-dlp/yt-dlp)
    - [zoxide](https://github.com/ajeetdsouza/zoxide)
    - [zsh-completions](https://github.com/zsh-users/zsh-completions)
- MacOS
    - [amethyst](https://ianyh.com/amethyst/)
    - [dozer](https://github.com/Mortennn/Dozer)
    - [mac-mouse-fix](https://mousefix.org/)
    - [raycast](https://www.raycast.com/)
    - [stats](https://github.com/exelban/stats)
- Linux (May depend on distro)
    - [gnome](https://www.gnome.org/)
    - [pop-shell](https://github.com/pop-os/shell)
    - [sddm](https://github.com/sddm/sddm)

*(For reference, I primarily use MacOS. Most of these programs are tailored for that.)*

---

### Notes

*<a name="note1">¹</a> If you are determined to run the script anyways, you can copy the relevant parts from
[run_once_before_install_programs.sh.tmpl](./.chezmoiscripts/run_once_before_install_programs.sh.tmpl) and run
that manually.*
