FROM alpine:3.4
RUN apk add --update git bash zsh vim python3
RUN ln -s /usr/bin/python3 /usr/bin/python
COPY . /git/underyx/dotfiles
RUN git clone /git/underyx/dotfiles
RUN dotfiles/install
CMD zsh

