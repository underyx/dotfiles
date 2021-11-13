# dotfiles [![build status][build status badge]][build status]

Got only 5 seconds to spend on this? Try my dotfiles out with
`docker run -ti ghcr.io/underyx/dotfiles`!

## Installation

1. Install `git`, `zsh`, `python`, and the `en_US.UTF-8` locale
1. Run `git clone https://github.com/underyx/dotfiles && dotfiles/install`

Whee! :tada:

## macOS notes

I normally install these things:

```
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions
brew install \
    coreutils \
    delta \
    findutils \
    git \
    gnupg \
    go \
    htop \
    jq \
    rust \
    svn \
    wget \
    1password \
    aws-vpn-client \
    dash \
    datagrip \
    docker \
    figma \
    flux \
    google-chrome \
    google-chrome-canary \
    google-drive \
    iterm2 \
    karabiner-elements \
    linear \
    mackup \
    ngrok \
    postman \
    raycast \
    rectangle \
    semgrep \
    slack \
    spotify \
    visual-studio-code

brew install \
    font-cozette \
    font-fira-code-for-powerline \
    font-roboto-mono-for-powerline \
    font-source-code-pro-for-powerline

versioned_tools=(kubectl kubectx terraform nodejs python)
for tool in $versioned_tools; do
  asdf plugin add $tool; asdf install $tool latest; asdf global $tool latest
done

asdf exec python -m pip install pipx
python_tools=(black docker-compose git-delete-merged-branches httpie mypy pipenv poetry tox)
for tool in $python_tools; do
  pipx install $tool
done
pipx install jupyter --include-deps
```

[build status badge]: https://gitlab.com/underyx/dotfiles/badges/master/build.svg
[build status]: https://gitlab.com/underyx/dotfiles/commits/master
