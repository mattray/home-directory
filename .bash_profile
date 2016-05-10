#This file is sourced by bash when you log in interactively.
[ -f ~/.bashrc ] && . ~/.bashrc

chruby ruby-2.2

. ~/.creds

# The next line updates PATH for the Google Cloud SDK.
source '/Users/mray/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/Users/mray/google-cloud-sdk/completion.bash.inc'

# docker docker docker
eval "$(docker-machine env default)"
