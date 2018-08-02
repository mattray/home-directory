#This file is sourced by bash when you log in interactively.
[ -f ~/.bashrc ] && . ~/.bashrc

# my ChefStyle is immensely strong
eval "$(/opt/chefdk/bin/chef shell-init bash)"

chruby ruby-2.5

. ~/.creds

# The next line updates PATH for the Google Cloud SDK.
# source '/Users/mray/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
# source '/Users/mray/google-cloud-sdk/completion.bash.inc'

# Azure shell command completion
# source '/Users/mray/lib/azure-cli/az.completion'

# path to the DCOS CLI binary
# if [[ "$PATH" != *"/Users/mray/dcos/bin"* ]];
#   then export PATH=$PATH:/Users/mray/dcos/bin;
# fi
