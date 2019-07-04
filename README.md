# dotfiles

This is a full repository of my development environment as it currently stands. It also contains a listing of my utilities, themes, and anything else I need when setting up a new machine.

## Steps

### Set up Firefox
My current preferred browser is [Firefox Developer Edition](https://www.mozilla.org/en-US/firefox/developer/).

I use Firefox Color to theme it. [This is the theme I made.](https://color.firefox.com/?theme=XQAAAALjAAAAAAAAAABBKYhm849SCiazH1KEGccwS-xNVAVUlUkhy_b8flDkc4UL33TIxTlTBxvpqcTQaoQxwR8u1HUiiDYveh-M-eU1wzW5Co2u-jUndDeMDET1hJsyxnqtFmlLJbM4HjZDYfuJi-ER6RQB47zQ_RAHIaiLdzT1qC2SYFLXgRfirt_XCa7GyNK_RKT7gZAn0YiKiodSKK9UuWkYdSLPW4QWdeGmZyMv_-mEOAA)

#### Firefox Extensions

##### [Trydactyl](https://addons.mozilla.org/en-US/firefox/addon/tridactyl-vim/)
Change default search engine to DuckDuckGo: `set searchengine duckduckgo`

### Set up 1Password
- [Download 1Password](https://1password.com/)
- Log in
- Add browser extensions

### Set up SSH key to pull down this repo
Github has an [excellent article](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/) on this.

### Dev folder
Add a folder under `~` called `dev`, cd into it, and clone this repo.

### Set up Terminal
- Apply the terminal preferences file in this repo
- Use [Fantasque Sans Mono](https://github.com/belluzj/fantasque-sans/releases) as the font

### Alfred
- [Download Alfred](https://www.alfredapp.com/)
- Apply Powerpack from 1Password vault
- Sync settings to iCloud
- Disable Spotlight
- Replace with Alfred's hotkey
- Use Nord theme contained in this repo

### Set up ZSH
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
**NOTE:** Some of the lines in this .zshrc file have to do with command line tools
installed in a later step.

```
export ZSH=$HOME/.oh-my-zsh

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit
prompt pure

# may need to add this if Oh My ZSH complains about unsafe completion directories
ZSH_DISABLE_COMPFIX=true

export VISUAL=vim
export EDITOR="$VISUAL"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"

alias cat="bat"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias help="tldr"
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias top="sudo htop"
```

### Set up command line tools
- Install [Homebrew](https://brew.sh/)
- Install the following Homebrew packages:
  - `bat`
  - `csvkit`
  - `diff-so-fancy`
  - `fd`
  - `fzf`
  - `htop`
  - `jq`
  - `mpd`
  - `n`
  - `ncdu`
  - `ncmpcpp`
  - `the_silver_searcher` (`ag`)
  - `tldr`
- Install the following global Node tools:
  - `npx`
  - `prettier`
- Add config directory for nvim: `mkdir ~/.config/nvim`
- Link the nvim config: `ln -s init.vim ~/.config/nvim/init.vim`
- Link the tmux config: `ln -s .tmux.conf ~/.tmux.conf`

#### Setting Up Git
Copy `.gitconfig` and `.gitignore` into the home directory. Change the user
email in `.gitconfig` to whatever is appropriate for this machine.

#### Setting Up FZF
Add useful key bindings and completion like so: `$(brew --prefix)/opt/fzf/install`

#### Setting Up Node
Run the following:
```
n lts
```

You may need to modify the ownership of certain directories so that you don't
have to run this with sudo. Additionally, a version of Node will be installed
with Yarn. Running the above command is mainly to make sure that `n` works.

#### Setting Up Tmuxinator
Install tmuxinator via:
```
sudo gem install tmuxinator -n /usr/local/bin
```

You may need to override the Mac system ruby by installing it via Homebrew and
prefixing it in your $PATH like so in the .zshrc:
```
export PATH="/usr/local/opt/ruby/bin:$PATH"
```

#### Setting Up Beets, MPD and NCMPCPP

### Setting Up Slack (If Necessary)
Install as normal and apply this theme:
```
#2E3440,#434C5E,#81A1C1,#ECEFF4,#434C5E,#ECEFF4,#A3BE8C,#BF616A
```

## Todo
- [ ] Add install link for Spotify
- [ ] Add install instructions for MPD and NCMPCPP
- [ ] Add section on VSCode (installation, theming, plugins)
