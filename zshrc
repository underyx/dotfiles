export ZSHHOME=~/.zsh

for file in ~/.zshlocal/pre/*(.N); do
  source $file
done

source $ZSHHOME/main

for file in ~/.zshlocal/post/*(.N); do
  source $file
done
