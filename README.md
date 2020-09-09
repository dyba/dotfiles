# Dotfiles

My custom dotfiles. The following must be installed depending on what you decide to link.

## Prerequisites

* Download Homebrew

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

* Install Oh My Zsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

* [Generate Your SSH Key](https://help.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

* Download [Powerline fonts](https://github.com/powerline/fonts)

## Requirements

<table>
  <tr>
    <th>Name</th>
    <th>Version</th>
  </tr>
  <tr>
    <td>Git</td>
    <td>2.13 or higher</td>
  </tr>
</table>

## Getting Started

* Clone the dotfiles repository
* `mv dotfiles .dotfiles`

## Terminal Look and Feel

* Update your font to 14-pt Source Code Pro for Powerline
* Update the color to Solarized Light

## Exuberant Ctags

* ```brew install ctags```

## rbenv

* [rbenv-default-gems](https://github.com/rbenv/rbenv-default-gems)
* [rbenv-ctags](https://github.com/tpope/rbenv-ctags)

## Git

* Add a `.gitconfig.personal` and `.gitconfig.work` to your home directory

```
[user]
    name = Your Name
    email = Your email address
```

## Spacemacs

You need to update your version of Emacs first:

```
brew tap d12frosted/emacs-plus
brew install emacs-plus
brew link emacs-plus
```

After that, link your `.spacemacs` file in your home directory to `~/.dotfiles/spacemacs.d/init.el`.

## Powerline

```
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

## Org-Mode

* Download [minted.sty](https://github.com/gpoore/minted/blob/master/source/minted.sty)
* Put the file in the correct directory
* `kpsewhich -var-value TEXMFLOCAL`
* Download Python 2.7.17: `asdf install python 2.7.17`
* Download Pygments: `pip install Pygments`
* Refresh your shims: `asdf reshim python 2.7.17`

```
curl -o "$(kpsewhich -var-value TEXMFLOCAL)/minted.sty" https://github.com/gpoore/minted/blob/master/source/minted.sty
```

## VSCode

```
brew install yapf # Python formatting
```

# Ergodox Layout

https://configure.ergodox-ez.com/ergodox-ez/layouts/N4Ya0/latest/0
