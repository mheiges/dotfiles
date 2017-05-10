export SHELL_HAS_READ_PROFILE=1
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

if [ -f ~/.git_bash_completion ]; then
  . ~/.git_bash_completion
fi

if [[ `uname` =~ 'Darwin' ]]; then

  [[ -s "$HOME/.profile" ]] && source "$HOME/.profile"
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
  export PATH=/opt/packer:$PATH
  export PATH=/opt/local/bin:/opt/local/sbin:/Volumes/korlan/opt/local/bin:/Volumes/korlan/opt/local/sbin:$PATH
  export PATH=$PATH:'/Library/Application Support/VMware Fusion'

  # setup gpg, including ssh agent
  # http://florin.myip.org/blog/easy-multifactor-authentication-ssh-using-yubikey-neo-tokens
  #
  # eval not needed if gpg-agent managed by GPGTools
  # eval $(gpg-agent --daemon)
  GPG_TTY=$(tty)
  export GPG_TTY
  if [ -f "${HOME}/.gpg-agent-info" ]; then
      . "${HOME}/.gpg-agent-info"
      export GPG_AGENT_INFO
      export SSH_AUTH_SOCK
  fi

  ifconfig() {
      netloc=$(/usr/sbin/scselect 2>&1 | egrep '^ \* ' |  sed 's:.*(\(.*\)):\1:')
      /sbin/ifconfig $*
      echo
      echo Network Location: $netloc
      echo
  }

  if [ -f ~/.vagrant_tabcomplete ]; then
    . ~/.vagrant_tabcomplete
  fi

fi

# Docker bash completion
if [ -d /Applications/Docker.app/Contents/Resources ]; then
 . /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion
 . /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion
 . /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion
fi

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


# don't include OrthoMCL.org, microbiome because on different code base
export SHAREDCODESITES="AmoebaDB.org CryptoDB.org EuPathDB.org FungiDB.org GiardiaDB.org HostDB.org MicrosporidiaDB.org PiroplasmaDB.org PlasmoDB.org SchistoDB.net ToxoDB.org TrichDB.org TriTrypDB.org"
export ALLSITES="AmoebaDB.org CryptoDB.org GiardiaDB.org EuPathDB.org FungiDB.org HostDB.org MicrobiomeDB.org MicrosporidiaDB.org OrthoMCL.org PiroplasmaDB.org PlasmoDB.org SchistoDB.net ToxoDB.org TrichDB.org TriTrypDB.org"
export ALLPROJECTS="AmoebaDB CryptoDB GiardiaDB EuPathDB FungiDB HostDB MicrobiomeDB MicrosporidiaDB OrthoMCL PiroplasmaDB PlasmoDB SchistoDB ToxoDB TrichDB TriTrypDB"


if `shopt -p | grep -q direxpand`; then
  # http://stackoverflow.com/questions/6418493/bash-variable-expansion-on-tab-complete
  shopt -s direxpand
fi

# cpan needs this
export FTP_PASSIVE=1

# if [ -f ~/.functions ]; then
#   check_uncommitted_dotfiles
#   check_unpushed_dotfiles
#   check_unmerged_dotfiles
# fi

export SQLPATH=~/.oracle
