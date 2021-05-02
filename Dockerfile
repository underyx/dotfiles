FROM alpine:3.13.5
RUN apk add --no-cache git bash zsh vim python
COPY . /git/underyx/dotfiles
RUN git clone /git/underyx/dotfiles
RUN dotfiles/install
CMD [zsh]
