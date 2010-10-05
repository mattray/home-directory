#This file is sourced by bash when you log in interactively.
#[ -f ~/.bashrc ] && . ~/.bashrc

#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.5.0/Home

export SVN_EDITOR=emacsclient

MYSQL=/usr/local/mysql
export GITHOME=/usr/local/git

export ZENHOME=/usr/local/zenoss
export PYTHONPATH=${ZENHOME}/zenoss/lib/python
export PATH=$HOME/bin:$MYSQL/bin:$ZENHOME/bin:$ZENHOME/python/bin:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:/bin:/usr/bin:/usr/bin/X11:/sbin:/usr/sbin:/usr/X11R6/bin/:$GITHOME/bin

export PS1="\u@\h(\$(date +%H:%M))\w \n\$ "
umask 077

export HISTCONTROL=ignoredups
export HISTFILESIZE=2000
export HISTSIZE=2000

if [ "dumb" == "$TERM" ];
    then
    alias ls="ls -AF";
    alias lsa="ls -lAF";
    alias lsr="ls -lAFrt";
    alias m='cat';
    alias more='cat';
    export PAGER=cat
else
    alias ls="ls -AFG";
    alias lsa="ls -lAFG";
    alias lsr="ls -lAFrtG";
    alias m='more'
    export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}: ${PWD/#$HOME/~}\007"'
fi

export EDITOR=emacsclient
alias emacs='emacsclient -n "$@"'

# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias cl='clear'
alias l='less'
alias ls1='ls -1'

alias curl="curl -sLO"

alias gitb="git branch" #list branches
alias gitco="git co" #checkout
alias gitd="git diff" #diff
alias gitdc="git diff --cached" #diff original
alias gitdh="git diff HEAD"  #diff head
alias gitl="git log --oneline --decorate -5" #just the last 5 logs
alias gitls="git log --stat --decorate -5" #just the last 5 logs with stats
alias gitr="git checkout --" #revert
alias gits="git status -s" #short status
alias gitst="git status" #long status
alias gitus="git unstage" #unstage a change alias was set with 'git config --global alias.unstage "reset HEAD"'

alias svns="svn status | sort"
alias svnu="svn update"
alias svnd="svn diff"

alias finds="find . -type f | grep -v .svn"

#zen25()
# {
#   sudo rm /usr/local/zenoss
#   sudo ln -s /usr/local/zenoss252 /usr/local/zenoss
#   export ZENHOME=/usr/local/zenoss
#   export PYTHONPATH=${ZENHOME}/zenoss/lib/python
#   export PATH=$HOME/bin:$MYSQL/bin:$ZENHOME/bin:$ZENHOME/python/bin:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:/bin:/usr/bin:/usr/bin/X11:/sbin:/usr/sbin:/usr/X11R6/bin/:$GITHOME/bin
# }

# #zen30()
# {
#   sudo rm /usr/local/zenoss
#   sudo ln -s /usr/local/zenoss30 /usr/local/zenoss
#   export ZENHOME=/usr/local/zenoss
#   export PYTHONPATH=${ZENHOME}/zenoss/lib/python
#   export PATH=$HOME/bin:$MYSQL/bin:$ZENHOME/bin:$ZENHOME/python/bin:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:/bin:/usr/bin:/usr/bin/X11:/sbin:/usr/sbin:/usr/X11R6/bin/:$GITHOME/bin
# }


pman () {
    man -t "${1}" | open -f -a /Applications/Preview.app
}


mysqlctl() {
  sudo /usr/local/MySQLCOM/MySQLCOM "$*"
}

export ZENENTZP=~/ws/enterprise/enterprise/zenpacks
export ZENCOREZP=~/ws/trunk/zenpacks
export ZENCOMMZP=~/ws/zenpacks
alias cde="cd $ZENENTZP"
alias cdc="cd $ZENCOREZP"
alias cdz="cd $ZENCOMMZP"
alias cdp="cd ~/ws/trunk/Products"


zpbase()
{
if [ "$#" -ne "2" ]
then
  echo Bad args: $@
else
  arg=$1
  base=$2
  dirPattern=.*\..*\..*$arg.*
  dir=`ls $base | grep -m1 -i $dirPattern`
  if [ "x$dir" != "x" ]
  then 
    deepDir=`echo $dir | sed 's/\(.*\)\.\(.*\)\.\(.*\)/&\/\1\/\2\/\3/'`
    echo $base/$deepDir
  fi
fi
}

zpcd()
{
if [ "$#" -ne "2" ]
then
  echo Bad args: $@
else
  pattern=$1
  baseDir=$2
  targetDir=`zpbase $pattern $baseDir`
  if [ "x$targetDir" !=  "x" ]
  then
    cd $targetDir
  fi
fi
}

zpe()
{
zpcd $1 $ZENENTZP
}

zpc()
{
zpcd $1 $ZENCOMMZP
}

zpr()
{
zpcd $1 $ZENCOREZP
}

zp()
{
if [ "$#" -ne "1" ]
then
  echo Bad args: $@
else
  pattern=$1
  for x in $ZENCOMMZP $ZENCOREZP $ZENENTZP
  do
    targetDir=`zpbase $pattern $x`
    if [ "x$targetDir" !=  "x" ]
    then
      cd $targetDir
      break
    fi
  done
fi
}

zfind()
{
if [ "$#" -eq "2" ]
then 
  suffix="$2"
else
  suffix="py"
fi
filesearch="*.$suffix"
find ${ZENHOME}/Products/ ${ZENCOREZP} ${ZENENTZP} ${ZENCOMMZP} -name "$filesearch" | grep $1
}

zgrep()
{
if [ "$#" -eq "2" ]
then 
  suffix="$2"
else
  suffix="py"
fi
filesearch="*.$suffix"
find ${ZENHOME}/Products/ ${ZENCOREZP} ${ZENENTZP} ${ZENCOMMZP} -name "$filesearch" | xargs grep $1
}

