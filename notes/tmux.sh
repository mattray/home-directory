# Ctrl-b c Create new window
# Ctrl-b d Detach current client
# Ctrl-b l Move to previously selected window
# Ctrl-b n Move to the next window
# Ctrl-b p Move to the previous window
# Ctrl-b & Kill the current window
# Ctrl-b , Rename the current window
# Ctrl-b % Split the current window into two panes
# Ctrl-b q Show pane numbers (used to switch between panes)
# Ctrl-b o Switch to the next pane
# Ctrl-b ? List all keybindings
tmux start-server
tmux new-session -d -s morbo -n "#0"
tmux new-window -t morbo:1 -n "#1"
tmux new-window -t morbo:2 -n "#2"
tmux new-window -t morbo:3 -n "#3"
tmux new-window -t morbo:4 -n "#4"
tmux new-window -t morbo:5 -n "#5"
tmux new-window -t morbo:6 -n "#6"
tmux new-window -t morbo:7 -n "#7"
tmux new-window -t morbo:8 -n "#8"
tmux new-window -t morbo:9 -n "#9"
tmux send-keys -t morbo:0 "rvm 1.9.2" C-m
tmux send-keys -t morbo:1 "rvm 1.9.2" C-m
tmux send-keys -t morbo:2 "rvm 1.9.2" C-m
tmux send-keys -t morbo:3 "rvm 1.9.2" C-m
tmux send-keys -t morbo:4 "rvm 1.9.2" C-m
tmux send-keys -t morbo:5 "rvm 1.9.2" C-m
tmux send-keys -t morbo:6 "rvm 1.9.2" C-m
tmux send-keys -t morbo:7 "rvm 1.9.2" C-m
tmux send-keys -t morbo:8 "rvm 1.9.2" C-m
tmux send-keys -t morbo:9 "rvm 1.9.2" C-m
tmux send-keys -t morbo:0 "cd ~/ws/demo-repo" C-m
tmux send-keys -t morbo:1 "cd ~/ws/demo-repo" C-m
tmux send-keys -t morbo:2 "cd ~/ws/demo-repo" C-m
tmux send-keys -t morbo:3 "cd ~/ws/demo-repo" C-m
tmux send-keys -t morbo:4 "cd ~/ws/demo-repo" C-m
tmux send-keys -t morbo:5 "cd ~/ws/demo-repo" C-m
tmux send-keys -t morbo:6 "cd ~/ws/demo-repo" C-m
tmux send-keys -t morbo:7 "cd ~/ws/demo-repo" C-m
tmux send-keys -t morbo:8 "cd ~/ws/demo-repo" C-m
tmux send-keys -t morbo:9 "cd ~/ws/demo-repo" C-m
sleep 10
tmux send-keys -t morbo:0 "knife ec2 server create -S mray -i ~/.ssh/mray.pem -x ubuntu -G default -I ami-a7a97dce -f m1.small -d omnibus -r 'role[btpeer],recipe[wfdemo]'" C-m
tmux send-keys -t morbo:1 "knife ec2 server create -S mray -i ~/.ssh/mray.pem -x ubuntu -G default -I ami-a7a97dce -f m1.small -d omnibus -r 'role[btpeer],recipe[wfdemo]'" C-m
tmux send-keys -t morbo:2 "knife ec2 server create -S mray -i ~/.ssh/mray.pem -x ubuntu -G default -I ami-a7a97dce -f m1.small -d omnibus -r 'role[btpeer],recipe[wfdemo]'" C-m
tmux send-keys -t morbo:3 "knife ec2 server create -S mray -i ~/.ssh/mray.pem -x ubuntu -G default -I ami-a7a97dce -f m1.small -d omnibus -r 'role[btpeer],recipe[wfdemo]'" C-m
tmux send-keys -t morbo:4 "knife ec2 server create -S mray -i ~/.ssh/mray.pem -x ubuntu -G default -I ami-a7a97dce -f m1.small -d omnibus -r 'role[btpeer],recipe[wfdemo]'" C-m
tmux send-keys -t morbo:5 "knife ec2 server create -S mray -i ~/.ssh/mray.pem -x ubuntu -G default -I ami-a7a97dce -f m1.small -d omnibus -r 'role[btpeer],recipe[wfdemo]'" C-m
tmux send-keys -t morbo:6 "knife ec2 server create -S mray -i ~/.ssh/mray.pem -x ubuntu -G default -I ami-a7a97dce -f m1.small -d omnibus -r 'role[btpeer],recipe[wfdemo]'" C-m
tmux send-keys -t morbo:7 "knife ec2 server create -S mray -i ~/.ssh/mray.pem -x ubuntu -G default -I ami-a7a97dce -f m1.small -d omnibus -r 'role[btpeer],recipe[wfdemo]'" C-m
tmux send-keys -t morbo:8 "knife ec2 server create -S mray -i ~/.ssh/mray.pem -x ubuntu -G default -I ami-a7a97dce -f m1.small -d omnibus -r 'role[btpeer],recipe[wfdemo]'" C-m
tmux send-keys -t morbo:9 "knife ec2 server create -S mray -i ~/.ssh/mray.pem -x ubuntu -G default -I ami-a7a97dce -f m1.small -d omnibus -r 'role[btpeer],recipe[wfdemo]'" C-m
tmux attach-session -t morbo
