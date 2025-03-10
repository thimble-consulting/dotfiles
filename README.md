# .files

This is the computer setup / dotfiles repo for Thimble!

It was forked from https://github.com/webpro/dotfiles to give us a setup to our computers that would be scripted and standardized.

## Packages Overview

- The repo uses [Homebrew](https://brew.sh) to install many (packages: [Brewfile](./install/Brewfile))
- [homebrew-cask](https://github.com/Homebrew/homebrew-cask) to install many (apps: [Caskfile](./install/Caskfile))
- [Mise](https://nodejs.org/en/download/), where possible, for languages and libraries like ruby, pnpm, etc.

A default installation using this includes:

- Ruby, Python, NodeJS all installed
- Postgres (with a setup for managing multiple postgres versions)
- Redis
- iTerm2 as a suggested terminal app

## Installation

### Software Updates & Pre-Install Settings

On a sparkling fresh installation of macOS, first install software updates and developer tools. The Xcode Command Line Tools includes `git` and `make` (not available on stock macOS).

```bash
sudo softwareupdate -i -a
xcode-select --install
```

Then [add a new ssh-key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key) to your machine, and your Github account.

Clone the dotfiles onto the machine:

```bash
git clone git@github.com:thimble-consulting/dotfiles.git ~/.dotfiles
```

Then ensure you update the dotfiles settings to your preferences. At a minimum, we suggest updating in `macos/defaults.sh` the `COMPUTER_NAME` to a preferred name.

```
COMPUTER_NAME=<switch-from-default>
```

Some other settings in that file that you may wish to edit include:

```
LANGUAGES
LOCALE
```

And in the `system/.env` file, you may wish to update the default editor (VSCode) and other vars:

```
export EDITOR="code"
export VISUAL="code"
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
```

### Running Install

Use the [Makefile](./Makefile) to install the [packages listed above](#packages-overview), and symlink
   [runcom](./runcom) and [config](./config) files (using [stow](https://www.gnu.org/software/stow/)):

```bash
cd ~/.dotfiles
make
```

Running `make` with the Makefile is idempotent. The installation process in the Makefile is tested on every push and every week in this
[GitHub Action](https://github.com/webpro/dotfiles/actions). Please file an issue in this repo if there are errors.

### Post-Installation

1. Set your Git credentials:

```sh
git config --global user.name "your name"
git config --global user.email "your@email.com"
git config --global github.user "your-github-username"
```

2. Set macOS [Dock items](./macos/dock.sh) and [system defaults](./macos/defaults.sh):

```sh
dot dock
dot macos
```

3. Start the RectangleApp and check in its settings that it is set to start on login.

4. Start Alfred and check in its settings that it is set to start on login.

5. [Optional] Change the mac Cmd-Space Keyboard Shortcut to open Alfred instead of Spotlight

  i. First, go to System Settings > Keyboard > Keyboard Shortcuts > Spotlight and disable the Cmd-Space setting
  ii. Then, in Alfred, set the shortcut to Cmd-Space

## Keeping libraries & settings up to date

The repo uses `topgrade` to run software updates. This is a library that automates checking if other libraries/systems need to be updated, including Homebrew, Mise, MacOS, Visual Studio Code Extensions and more. To run these updates just run:

```
topgrade
```

If/when you make changes to existing dotfiles, check them into git and push them up. We haven't decided on a way to manage the dotfiles as a team - let's explore as we go, with the aim of having the main repo be a common starting point, and individual settings maintained separately. Perhaps we create individual forks off this main repo and merge back in common settings.

If/when you add new configs to your machine, check them into the repo like other dotfiles.

## The `dot` command

```
$ dot help
Usage: dot <command>

Commands:
   clean            Clean up caches (brew, cargo, gem, pip)
   dock             Apply macOS Dock settings
   edit             Open dotfiles in IDE ($VISUAL) and Git GUI ($VISUAL_GIT)
   help             This help message
   macos            Apply macOS system defaults
   test             Run tests
   update           Update packages and pkg managers (brew, casks, cargo, pip3, npm, gems, macOS)
```

## Notes on Postgres / Redis

To manage Postgres versions, we're using an approach outlined [on this post](https://medium.com/keeping-code/running-multiple-postgresql-versions-simultaneously-on-macos-linux-90b3d7e08ffd).

The main parts to know are:

1. To install a specific version of postgres, add `brew "postgresql@<version-number>"` to the `install/Brewfile` and then run `make`
2. To create a new cluster of a specific version, run `pg_createcluster <version> <cluster-name>`. A nice default is to name your cluster `main`, e.g. `pg_createcluster <version> main`.
3. To run commands on a cluster, run `pg_ctlcluster <version> <cluster-name> <cmd>`. To start main on v17, for ex, `pg_ctlcluster 17 main start`.

Redis is installed with Homebrew as well. We recommend not starting redis or postgres at system start, and instead run them when you need to. To run redis, you can just run `redis-server`. Or, to run it in the background, `redis-server &`.

## Customize

To customize the dotfiles to your likings, fork it and [be the king of your castle!](https://www.webpro.nl/articles/getting-started-with-dotfiles)

## Credits

Many thanks to the [dotfiles community](https://dotfiles.github.io).
