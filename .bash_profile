#This file is sourced by bash when you log in interactively.
[ -f ~/.bashrc ] && . ~/.bashrc

# my ChefStyle is immensely strong
# export PATH+=/opt/chefdk/embedded/bin
# eval "$(/opt/chefdk/bin/chef shell-init bash)"

chruby ruby-2.6

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mattray/ws/google-cloud-sdk/path.bash.inc' ]; then . '/Users/mattray/ws/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mattray/ws/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/mattray/ws/google-cloud-sdk/completion.bash.inc'; fi
export PATH="/usr/local/opt/terraform@0.11/bin:$PATH"
