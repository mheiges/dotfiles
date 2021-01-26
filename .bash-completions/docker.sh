# Docker bash completion
if [[ -f $(brew --prefix)/etc/bash_completion ]]; then
  source $(brew --prefix)/etc/bash_completion
fi
if [ -d /Applications/Docker.app/Contents/Resources ]; then
 . /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion
 . /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion
fi

