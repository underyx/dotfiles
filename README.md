# dotfiles [![build status][build status badge]][build status]

Got only 5 seconds to spend on this? Try my dotfiles out with
`docker run -ti registry.gitlab.com/underyx/dotfiles`!

## Installation

1. Install `git`, `zsh`, `python`, and the `en_US.UTF-8` locale
2. Run `git clone https://github.com/underyx/dotfiles && dotfiles/install`

Whee! :tada:

## macOS notes

I normally install these things:

```
brew install \
    coreutils \
    findutils \
    git \
    gnupg \
    htop \
    kubectx \
    kubernetes-cli \
    pinentry-mac

brew tap homebrew/cask-fonts

brew cask install \
    amethyst \
    discord \
    docker \
    dynalist \
    flux \
    font-roboto-mono-for-powerline \
    google-chrome \
    iterm2 \
    karabiner-elements \
    keybase \
    marvin \
    spotify \
    steam \
    visual-studio-code
```

[build status badge]: https://gitlab.com/underyx/dotfiles/badges/master/build.svg
[build status]: https://gitlab.com/underyx/dotfiles/commits/master
