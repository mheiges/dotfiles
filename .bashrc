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

PATH=$HOME/bin:$PATH
if [ -d $HOME/.rvm ]; then
  PATH=$PATH:$HOME/.rvm/bin
fi
export PATH

export PROJECT_HOME=/junk
export GUS_HOME=/also/junk

if [ `hostname -s` = "elm" ]; then
  if [ -f /eupath/workflow-software/etc/bashrc ]; then
     . /eupath/workflow-software/etc/bashrc
  fi
fi

if [ -d /Applications/iRODS.app ]; then
  export PATH=/Applications/iRODS.app/Contents/PlugIns/irods/icommands:$PATH
  export DYLD_LIBRARY_PATH=/Applications/iRODS.app/Contents/Frameworks:$DYLD_LIBRARY_PATH
fi


export VAGRANT_DEFAULT_PROVIDER=virtualbox
