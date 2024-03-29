export SHELL_HAS_READ_PROFILE=1
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

for i in ~/.bash-completions/*.sh ; do
  if [ -r "$i" ]; then
    if [ "${-#*i}" != "$-" ]; then
      . "$i"
    else
      . "$i" >/dev/null
    fi
  fi
done

if [[ `uname` =~ 'Darwin' ]]; then

  [[ -s "$HOME/.profile" ]] && source "$HOME/.profile"
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
  export PATH=/opt/packer:$PATH
  if [[ -d $HOME/.tfenv/bin ]]; then
    export PATH=$HOME/.tfenv/bin:$PATH
  else
    export PATH=/opt/terraform:$PATH
  fi
  export PATH=/opt/local/bin:/opt/local/sbin:/Volumes/korlan/opt/local/bin:/Volumes/korlan/opt/local/sbin:$PATH
  export PATH=$PATH:'/Library/Application Support/VMware Fusion'

  # setup gpg, including ssh agent
  # http://florin.myip.org/blog/easy-multifactor-authentication-ssh-using-yubikey-neo-tokens
  #
  # eval not needed if gpg-agent managed by GPGTools
  # eval $(gpg-agent --daemon)
#   GPG_TTY=$(tty)
#   export GPG_TTY
#   if [ -f "${HOME}/.gpg-agent-info" ]; then
#       . "${HOME}/.gpg-agent-info"
#       export GPG_AGENT_INFO
#       export SSH_AUTH_SOCK
#   fi

  ifconfig() {
      netloc=$(/usr/sbin/scselect 2>&1 | egrep '^ \* ' |  sed 's:.*(\(.*\)):\1:')
      /sbin/ifconfig $*
      echo
      echo Network Location: $netloc
      echo
  }

fi

#if command -v rbenv >/dev/null 2>&1; then
#  eval "$(rbenv init -)"
#fi

export FIGNORE=.svn:.git
export EDITOR=vim

if [[ -s "$HOME/.git-prompt.sh" ]]; then
  source "$HOME/.git-prompt.sh"
  export PS1='\n[$(date \+"%H:%M %Y%m%d") \u@\h \w]\n\[\033[m\]\[\e[0;32m\]$(__git_ps1 "(%s) ")\[\e[0m\]\$ '
else
  export PS1='\n[$(date +"%H:%M %Y%m%d") \u@\h \w]\n\$ '
fi

export HISTCONTROL='ignoreboth'
export HISTFILESIZE=20000
export HISTSIZE=20000


#if `shopt -p | grep -q direxpand`; then
#  # http://stackoverflow.com/questions/6418493/bash-variable-expansion-on-tab-complete
#  shopt -s direxpand
#fi

# cpan needs this
export FTP_PASSIVE=1

# if [ -f ~/.functions ]; then
#   check_uncommitted_dotfiles
#   check_unpushed_dotfiles
#   check_unmerged_dotfiles
# fi

export SQLPATH=~/.oracle

# pyenv init
# https://github.com/pyenv/pyenv
if [ -x "$(command -v pyenv)" ]; then
  eval "$(pyenv init -)"
fi

export PATH=~/.local/bin:$PATH

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

#OktaAWSCLI
if [[ -f "$HOME/.okta/bash_functions" ]]; then
    . "$HOME/.okta/bash_functions"
fi
if [[ -d "$HOME/.okta/bin" && ":$PATH:" != *":$HOME/.okta/bin:"* ]]; then
    PATH="$HOME/.okta/bin:$PATH"
fi
export PATH="/usr/local/sbin:$PATH"

if [[ "$HOSTNAME" == "sb-6470a75c1" ]]; then
  export NEW_RELIC_API_KEY="$(security find-generic-password -s newrelic-api-key -w)"
  # https://github.com/terraform-aws-modules/terraform-aws-lambda#faq
  export TF_RECREATE_MISSING_LAMBDA_PACKAGE=false
fi

#export PATH="/usr/local/opt/node@12/bin:$PATH"

export PATH="$HOME/.poetry/bin:$PATH"
. "$HOME/.cargo/env"
