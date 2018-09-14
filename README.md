# dotfiles

This is a full repository of my development environment as it currently stands. It also contains a listing of my utilities, themes, and anything else I need when setting up a new machine.

## Steps

### Setup Firefox
My current preferred browser is [Firefox Developer Edition](https://www.mozilla.org/en-US/firefox/developer/).

I use Firefox Color to theme it. [This is the theme I made.](https://color.firefox.com/?theme=XQAAAALjAAAAAAAAAABBKYhm849SCiazH1KEGccwS-xNVAVUlUkhy_b8flDkc4UL33TIxTlTBxvpqcTQaoQxwR8u1HUiiDYveh-M-eU1wzW5Co2u-jUndDeMDET1hJsyxnqtFmlLJbM4HjZDYfuJi-ER6RQB47zQ_RAHIaiLdzT1qC2SYFLXgRfirt_XCa7GyNK_RKT7gZAn0YiKiodSKK9UuWkYdSLPW4QWdeGmZyMv_-mEOAA)

### Setup 1Password
- [Download 1Password](https://1password.com/)
- Log in
- Add browser extensions

### Setup SSH key to pull down this repo
Github has an [excellent article](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/) on this.

### Dev folder
Add a folder under `~` called `dev`, cd into it, and clone this repo.

### Alfred
- [Download Alfred](https://www.alfredapp.com/)
- Apply Powerpack from 1Password vault
- Sync settings to iCloud
- Disable Spotlight
- Replace with Alfred's hotkey
- Use Nord theme contained in this repo

### Setup ZSH
I use:
- [Oh My ZSH](https://github.com/robbyrussell/oh-my-zsh): `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
- [Pure Prompt](https://github.com/sindresorhus/pure) (See setup instructions below)
- [ZSH Syntax Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

#### Setting up Pure Prompt
Copy `prompt-pure-setup` and `async` from this repo into `~/.oh-my-zsh/functions`
In `.zshrc`, set `ZSH_THEME=""` and add the following lines:
```
autoload -U promptinit; promptinit
prompt pure
```

#### Default .zshrc
```
# may need to add this if Oh My ZSH complains about unsafe completion directories
ZSH_DISABLE_COMPFIX=true

export VISUAL=vim
export EDITOR="$VISUAL"
```

### Setup Terminal
- Apply the terminal preferences file in this repo
- Use [Fira Code](https://github.com/tonsky/FiraCode) as the font


## Todo
- [ ] Add section on favorite command line tools
