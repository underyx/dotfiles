FROM debian

RUN \
  apt-get update &&\
  apt-get install -y --no-install-recommends ca-certificates curl file git zsh vim python3 tree &&\
  update-ca-certificates &&\
  rm -rf /var/lib/apt/lists/*

COPY . /git/underyx/dotfiles

RUN \
  git clone /git/underyx/dotfiles &&\
  dotfiles/install &&\
  TERM=screen-256color /bin/zsh -isc "@zinit-scheduler burst"

ENTRYPOINT [ "/bin/zsh" ]
