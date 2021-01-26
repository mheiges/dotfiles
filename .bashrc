export SHELL_HAS_READ_BASHRC=1
if [ -z "$PS1" ]; then
  shopt -s expand_aliases
fi

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

if [ -f ~/.functions ]; then
  . ~/.functions
fi

PATH=$HOME/bin:$PATH
if [ -d $HOME/.rvm ]; then
  PATH=$PATH:$HOME/.rvm/bin
fi
export PATH


if [ -d /Applications/iRODS.app ]; then
  export PATH=/Applications/iRODS.app/Contents/PlugIns/irods/icommands:$PATH
  export DYLD_LIBRARY_PATH=/Applications/iRODS.app/Contents/Frameworks:$DYLD_LIBRARY_PATH
fi

if [ -d ~/Library/Python/2.7/bin ]; then
  export PATH=~/Library/Python/2.7/bin/:$PATH
fi

if [[ `uname` =~ 'Darwin' ]]; then
  export VAGRANT_DEFAULT_PROVIDER=virtualbox

  # https://github.com/ansible/ansible/issues/31869
  export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
fi


if [ -f /usr/local/Cellar/openvpn/2.4.6/sbin/openvpn ]; then
  export PATH=/usr/local/Cellar/openvpn/2.4.6/sbin:$PATH
fi

export HISTTIMEFORMAT="%Y%m%d %T "

export BASH_SILENCE_DEPRECATION_WARNING=1
