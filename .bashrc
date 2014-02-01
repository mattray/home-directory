source /usr/local/share/chruby/chruby.sh

function git_branch {
    git branch --no-color 2> /dev/null | egrep '^\*' | sed -e 's/^* //'
}

function git_dirty {
  # only tracks modifications, not unknown files needing adds
    if [ -z "`git status -s | awk '{print $1}' | grep '[ADMTU]'`" ] ; then
        return 1
    else
        return 0
    fi
}

function dirty_git_prompt {
    branch=`git_branch`
    if [ -z "${branch}" ] ; then
        return
    fi
    git_dirty && echo "(${branch}*)"
}

function clean_git_prompt {
    branch=`git_branch`
    if [ -z "${branch}" ] ; then
        return
    fi
    git_dirty || echo "(${branch})"
}

function ruby_version_gemset {
    ruby_version=$(chruby | grep \* | cut -d'-' -f 2)
    chgemset_name=$(echo $GEM_HOME | awk '{split($0,a,"/.gem"); print a[1]}' | awk -F/ '{print $NF}')
    if [ -z "$ruby_version" ] ; then # no chruby, must be system
        if [ -z "$chgemset_name" ] ; then
            echo "SYSTEM"
        else
            echo "SYSTEM-${chgemset_name}"
        fi
    else
        if [ $USER = $chgemset_name ] ; then
            echo "${ruby_version}"
        else
            echo "${ruby_version}-${chgemset_name}"
        fi
    fi
}

gemset () {
    echo "${1}"
    chgems "${1}"
}

export PS1="\[\e[36m\]\u@\h\[\e[37m\][\A]\[\e[31m\]\$(ruby_version_gemset)\[\e[32m\]\$(clean_git_prompt)\[\e[33m\]\$(dirty_git_prompt)\[\e[34m\]\w\n\[\e[37m\]\$\[\e[0m\] "
