FROM debian

RUN \
  apt-get update &&\
  apt-get install -y --no-install-recommends ca-certificates curl file git zsh vim openssh-client python3 tree &&\
  update-ca-certificates

COPY . /git/underyx/dotfiles

RUN \
  mkdir -m 0700 /root/.ssh &&\
  touch -m 0600 /root/.ssh/known_hosts &&\
  ssh-keygen -q -t rsa -N '' -f /root/.ssh/id_rsa &&\
  echo "IdentityFile /root/.ssh/id_rsa" >> /etc/ssh/ssh_config && \
  echo -e "StrictHostKeyChecking no" >> /etc/ssh/ssh_config && \
  git clone /git/underyx/dotfiles &&\
  dotfiles/install &&\
  TERM=screen-256color /bin/zsh -isc "@zinit-scheduler burst"

ENTRYPOINT [ "/bin/zsh" ]
