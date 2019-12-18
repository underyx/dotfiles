export ZSHHOME=~/.zsh
source $ZSHHOME/main

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/underyx/.npm-packages/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/underyx/.npm-packages/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/underyx/.npm-packages/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /home/underyx/.npm-packages/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /home/underyx/.npm-packages/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /home/underyx/.npm-packages/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh