export ZSHHOME=~/.zsh

for file in ~/.zshlocal/pre/*(.N); do
  source $file
done

source $ZSHHOME/main

for file in ~/.zshlocal/post/*(.N); do
  source $file
done

# opam configuration
[[ ! -r /Users/underyx/.opam/opam-init/init.zsh ]] || source /Users/underyx/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
