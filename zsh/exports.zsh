#export PS1="%{$fg[green]%}[%e %W]$ %{$reset_color%}"

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# Cabal
export PATH="/Users/christian/.cabal/bin:$PATH"

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# My scripts
export PATH="/Users/$(whoami)/.scripts:$PATH"

# Composer (PHP)
export PATH="/Users/$(whoami)/.composer/vendor/bin:$PATH"

# rbenv
#export RBENV_ROOT="$HOME/.rbenv"

#if [ -d $RBENV_ROOT ]; then
  #export PATH="$RBENV_ROOT/bin:$PATH"
  #eval "$(rbenv init -)"
#fi

# ANTLR4
export CLASSPATH=".:/usr/local/Cellar/antlr/4.2.2/antlr-4.2.2-complete.jar:$CLASSPATH"
alias grun='java org.antlr.v4.runtime.misc.TestRig'

# Setup terminal, and turn on colors
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# reattach-to-user-namespace is needed because of macOS sierra
export EDITOR="reattach-to-user-namespace vim"

# Groovy
export GROOVY_HOME=/usr/local/opt/groovy/libexec
