#!/usr/bin/env zx

/***********/
/* HELPERS */
/***********/

const hm = os.homedir()

const out = process.stdout

const bg = chalk.bold.green
const bl = chalk.blue
const bm = chalk.bold.magenta
const bmu = chalk.bold.magenta.underline
const br = chalk.bold.red
const m = chalk.magenta

const { log } = console

const waitingIndicator = async (prefix, string, waitOn) => {
  out.write(`${prefix}${string}...`)
  let pending = true
  waitOn.then(() => (pending = false))

  let sleepTime = 50
  if (string.length === 4 || string.length === 5) sleepTime = 120
  if (string.length < 4) sleepTime = 300

  let i = 1
  let reverse = false
  while (pending) {
    await sleep(sleepTime)
    if (!pending) return
    if (i === string.length) {
      reverse = !reverse
      i = 0
    }
    while (i !== 0 && /\s/.test(string[i - 1])) i++
    out.moveCursor(-string.length - 3)
    let color = string.slice(0, i)
    let plain = string.slice(i)
    if (reverse) plain = bl(plain)
    else color = bl(color)
    out.write(`${color}${plain}...`)
    i++
  }
}

const clearLine = () => {
  out.clearLine()
  out.cursorTo(0)
}

const install = async (name, cmd, prefix, message) => {
  message =
    message ||
    ((name, code) => {
      clearLine()
      if (code !== 0) {
        log(`${br`X`} ${name}`)
        console.error(stderr)
        process.exit(1)
      }
      log(`${bg`✔`} ${name}`)
    })

  const promise = nothrow(cmd)
  waitingIndicator(prefix, name, promise)
  const { exitCode, stderr } = await promise
  log(message(name, exitCode))
}

const nestedInstall = (name, cmd) => install(name, cmd, '  ')

const yesNo = async (questionString, msgFn) => {
  const answer = /^y/.test(await question(`${questionString} (y/${bmu`n`}) `))
  out.moveCursor(0, -1)
  out.clearLine()
  log(msgFn(answer))
  return answer
}

const run = async (cmd, msg, successMsg) => {
  log(msg)
  await cmd
  out.moveCursor(0, -1)
  out.clearLine()
  log(successMsg)
}

/*********/
/* STEPS */
/*********/

const setup = () => {
  $.verbose = false
}

const showBanner = () => {
  log(`┌─────────────────────┐`.normalize())
  log(`│ ${bm`SETH'S SETUP SCRIPT`} │`.normalize())
  log(`└─────────────────────┘`.normalize())
  log()
}

const askIsPersonal = () =>
  yesNo(
    `Is this a ${bm`personal computer`}?`,
    answer => `This ${answer ? bg`is` : br`is not`} a ${m`personal computer`}.`
  )

const askShouldInstallSlack = () =>
  yesNo(
    `Should I install ${bm`Slack`}?`,
    answer => `I ${answer ? bg`will` : br`will not`} install ${m`Slack`}.`
  )

const cloneDotfilesRepoIntoDev = async isPersonal => {
  const devDir = `${hm}/dev${isPersonal ? '' : '/personal'}`
  await fs.ensureDir(devDir)
  cd(devDir)

  await run(
    $`git clone https://github.com/SethGunnells/dotfiles.git`,
    'Cloning dotfiles repo...',
    `${bg`✔`} Cloned dotfiles repo into "${devDir}/dotfiles`
  )
  cd('dotfiles')
}

const installOhMyZsh = () =>
  install(
    'Oh My ZSH',
    'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"',
    'Installing ',
    (_, code) =>
      code === 0
        ? `✨ ${bg`Installed`} Oh My ZSH!\n`
        : `Installing Oh My ZSH ${br`failed!`}`
  )

const installHomebrew = () =>
  install(
    'Homebrew',
    '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"',
    'Installing ',
    (_, code) =>
      code === 0
        ? `✨ ${bg`Installed`} Homebrew!\n`
        : `Installing Homebrew ${br`failed!`}`
  )

const installPackages = async () => {
  const brewPackages = [
    'bat',
    'csvkit',
    'diff-so-fancy',
    'exa',
    'fd',
    'fzf',
    'htop',
    'httpie',
    'jq',
    'lua-language-server',
    'n',
    'neovim',
    'pure',
    'ripgrep',
    'tmux',
    'wget',
  ]

  log('Installing Homebrew packages... (This will take a while.)')
  for (const pkg of brewPackages) {
    await nestedInstall(pkg, $`brew install ${pkg}`)
  }
  log('✨ Homebrew packages installed!')
}

const installApps = async shouldInstallSlack => {
  const brewCasks = {
    '1password': '1Password',
    dash: 'Dash',
    'firefox-developer-edition': 'Firefox Developer Edition',
    'google-chrome': 'Chrome',
    hammerspoon: 'Hammerspoon',
    hey: 'Hey',
    iterm2: 'iTerm2',
    raycast: 'Raycast',
    slack: 'Slack',
    spotify: 'Spotify',
  }

  if (shouldInstallSlack) brewCasks.slack = 'Slack'

  log('Installing apps... (This will also probably take a while)')
  for (const cask in brewCasks) {
    await nestedInstall(brewCasks[cask], $`brew install --cask ${cask}`)
  }
  log('✨ Apps installed!')
}

const installYarnGlobals = async () => {
  const yarnGlobals = [
    'diagnostic-languageserver',
    'eslint_d',
    'prettier',
    'typescript',
    'typescript-language-server',
  ]

  log('Installing yarn globals...')
  for (const pkg of yarnGlobals) {
    await nestedInstall(pkg, $`yarn install ${pkg}`)
  }
  log('✨ Yarn globals installed!')
}

const linkConfigFiles = async () => {
  const configs = [
    {
      name: 'bat',
      srcFile: 'batConfig',
      path: `${hm}/.config/bat`,
      destFile: 'config',
    },
    { name: 'git', srcFile: '.gitconfig', path: `${hm}` },
    { name: 'iTerm2', srcFile: 'com.googlecode.iterm2.plist', path: `${hm}` },
    { name: 'nvim', srcFile: 'nvim', path: `${hm}/.config` },
    { name: 'tmux', srcFile: '.tmux.conf', path: `${hm}` },
    { name: 'zsh', srcFile: '.zshrc', path: `${hm}` },
  ]

  log('Linking config files...')
  for (const config of configs) {
    const { destFile, name, path, srcFile } = config
    out.write(`  ${name} (${destFile || srcFile})...`)
    await fs.ensureDir(path)
    const { exitCode, stderr } = await nothrow($``)
    clearLine()
    if (exitCode !== 0) {
      log(`${br`X`} ${pkg}`)
      console.error(stderr)
      process.exit(1)
    }
    log(`${bg`✔`} ${pkg}`)
  }

  log('✨ All config files linked!')
}

const setupFzf = () =>
  run(
    $`$(brew --prefix)/opt/fzf/install`,
    `Running FZF install script...`,
    'FZF setup complete!'
  )

const installTermProfiles = async () => {
  out.write('Installing terminal profiles...')
  await $`tic -x xterm-256color-italic.terminfo`
  await $`tic -x tmux.terminfo`
  clearLine()
  log(`Terminal profiles have been ${bg`successfully installed`}!`)
}

const installPreferredFont = async () => {
  out.write('Installing Fantasque Sans Mono font from Nerd Fonts')
  await $`brew tap homebrew/cask-fonts`
  await $`brew install homebrew/cask-fonts/font-fantasque-sans-mono-nerd-font`
  clearLine()
  log(`Fantasque Sans Mono font has been ${bg`successfully installed`}!`)
}

const setupGit = async () => {
  const email = await question('What email address should Git use? ')
  await fs.writeFile(`${hm}/.email`, `[user]\n  email = ${email}`)
  clearLine()
  log(`Git will use ${bm(email)} as the default email address`)
}

const setupMpd = async () => {
  log('Setting up MPD...')
  const [rawConf, { stdout: user }] = await Promise.all([
    fs.readFile('mpd.conf'),
    $`whoami`,
    fs.ensureDir(`${hm}/.mpd`),
  ])
  const conf = rawConf.replace('<user>', user)
  await fs.writeFile(`${hm}/.mpd/mpd.conf`, conf)
  clearLine()
  log(`MPD has been ${bg`successfully configured`}!`)
}

/***************/
/* SCRIPT BODY */
/***************/

setup()
showBanner()
const isPersonal = await askIsPersonal()
const shouldInstallSlack = !isPersonal && (await askShouldInstallSlack())
log()
await setupGit()
await cloneDotfilesRepoIntoDev(isPersonal)
await installOhMyZsh()
await installHomebrew()
await installPackages()
await installApps()
await installYarnGlobals()
await linkConfigFiles()
await setupFzf()
await installTermProfiles()
await installPreferredFont()
await setupMpd()
