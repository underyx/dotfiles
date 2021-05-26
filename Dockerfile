FROM alpine:3.13.5

RUN apk add --no-cache file git bash zsh vim python3 openssh

COPY . /git/underyx/dotfiles

RUN \
  mkdir -p ~/.ssh &&\
  ssh-keyscan github.com >> ~/.ssh/known_hosts &&\
  git clone /git/underyx/dotfiles &&\
  dotfiles/install

SHELL [ "/bin/zsh", "-c" ]
RUN source ~/.zshrc && zinit update --all

ENTRYPOINT [ "/bin/zsh" ]
