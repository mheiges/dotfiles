# Docker bash completion
# Requires `brew install bash-completion`
if [[ -f $(brew --prefix)/etc/bash_completion ]]; then
  source $(brew --prefix)/etc/bash_completion
else
  echo 'Run `brew install bash-completion` for Docker bash completion'
fi
if [ -d /Applications/Docker.app/Contents/Resources ]; then
 . /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion
 . /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion
fi

