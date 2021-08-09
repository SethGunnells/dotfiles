# dotfiles

This is a full repository of my development environment as it currently stands. It also contains a listing of my utilities, themes, and anything else I need when setting up a new machine.

## Steps

### Run `init.sh` from this repo
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/SethGunnells/dotfiles/master/init.sh)"
```

### Set up Firefox
My current preferred browser is [Firefox Developer Edition](https://www.mozilla.org/en-US/firefox/developer/).

I use Firefox Color to theme it. [This is the theme I made.](https://color.firefox.com/?theme=XQAAAALjAAAAAAAAAABBKYhm849SCiazH1KEGccwS-xNVAVUlUkhy_b8flDkc4UL33TIxTlTBxvpqcTQaoQxwR8u1HUiiDYveh-M-eU1wzW5Co2u-jUndDeMDET1hJsyxnqtFmlLJbM4HjZDYfuJi-ER6RQB47zQ_RAHIaiLdzT1qC2SYFLXgRfirt_XCa7GyNK_RKT7gZAn0YiKiodSKK9UuWkYdSLPW4QWdeGmZyMv_-mEOAA)

#### Firefox Extensions

##### [Trydactyl](https://addons.mozilla.org/en-US/firefox/addon/tridactyl-vim/)
Change default search engine to DuckDuckGo: `set searchengine duckduckgo`

### Set up 1Password
- Log in
- Add browser extension

### Set up SSH key to pull down this repo
Github has an [excellent article](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) on this.

### Set up Terminal
- Setup terminal preferences file in this repo
    - Set new italic TERM profile
    - Set font
- Setup neovim plugins

### Raycast
- Disable Spotlight
- Set shortcut
- Set prefered hotkeys, scripts, and quicklinks

### Setting Up Slack (If Necessary)
Install as normal and apply this theme:
```css
#2E3440,#434C5E,#81A1C1,#ECEFF4,#434C5E,#ECEFF4,#A3BE8C,#BF616A
```

