# Source global definitions
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

if [ `hostname -s` = "holly" ]; then
  if [ -f /eupath/workflow-software/etc/bashrc ]; then
     . /eupath/workflow-software/etc/bashrc
  fi
fi
