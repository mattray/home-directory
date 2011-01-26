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
tmux send-keys -t morbo:0 "rvm system" C-m
tmux send-keys -t morbo:1 "rvm system" C-m
tmux send-keys -t morbo:2 "rvm system" C-m
tmux send-keys -t morbo:3 "rvm system" C-m
tmux send-keys -t morbo:4 "rvm system" C-m
tmux send-keys -t morbo:5 "rvm system" C-m
tmux send-keys -t morbo:6 "rvm system" C-m
tmux send-keys -t morbo:7 "rvm system" C-m
tmux send-keys -t morbo:8 "rvm system" C-m
tmux send-keys -t morbo:9 "rvm system" C-m
tmux send-keys -t morbo:0 "cd ~/ws/chef-repo" C-m
tmux send-keys -t morbo:1 "cd ~/ws/chef-repo" C-m
tmux send-keys -t morbo:2 "cd ~/ws/chef-repo" C-m
tmux send-keys -t morbo:3 "cd ~/ws/chef-repo" C-m
tmux send-keys -t morbo:4 "cd ~/ws/chef-repo" C-m
tmux send-keys -t morbo:5 "cd ~/ws/chef-repo" C-m
tmux send-keys -t morbo:6 "cd ~/ws/chef-repo" C-m
tmux send-keys -t morbo:7 "cd ~/ws/chef-repo" C-m
tmux send-keys -t morbo:8 "cd ~/ws/chef-repo" C-m
tmux send-keys -t morbo:9 "cd ~/ws/chef-repo" C-m
sleep 10
tmux send-keys -t morbo:0 "knife ec2 server create 'role[Seattle]' 'role[ServerSSHLinuxMySQL]' -S mray -I ~/.ssh/mray.pem  -x ubuntu -G default -i ami-a2f405cb -f t1.micro" C-m
tmux send-keys -t morbo:1 "knife ec2 server create 'role[base]' 'role[Austin]' 'role[ServerSSHLinux]' -S mray -I ~/.ssh/mray.pem  -x ubuntu -G default -i ami-a2f405cb -f t1.micro" C-m
tmux send-keys -t morbo:2 "knife ec2 server create 'role[base]' 'role[Austin]' 'role[ServerSSHLinux]' -S mray -I ~/.ssh/mray.pem  -x ubuntu -G default -i ami-a2f405cb -f t1.micro" C-m
tmux send-keys -t morbo:3 "knife ec2 server create 'role[base]' 'role[Austin]' 'role[ServerSSHLinux]' -S mray -I ~/.ssh/mray.pem  -x ubuntu -G default -i ami-a2f405cb -f t1.micro" C-m
tmux send-keys -t morbo:4 "knife ec2 server create 'role[Austin]' 'role[ServerSSHLinux]' -S mray -I ~/.ssh/mray.pem  -x ubuntu -G default -i ami-a2f405cb -f t1.micro" C-m
tmux send-keys -t morbo:5 "knife ec2 server create 'role[Seattle]' 'role[ServerSSHLinux]' -S mray -I ~/.ssh/mray.pem  -x ubuntu -G default -i ami-a2f405cb -f t1.micro" C-m
tmux send-keys -t morbo:6 "knife ec2 server create 'role[Seattle]' 'role[ServerSSHLinux]' -S mray -I ~/.ssh/mray.pem  -x ubuntu -G default -i ami-a2f405cb -f t1.micro" C-m
tmux send-keys -t morbo:7 "knife ec2 server create 'role[base]' 'role[Seattle]' 'recipe[zenoss::client]' -S mray -I ~/.ssh/mray.pem  -x ubuntu -G default -i ami-a2f405cb -f t1.micro" C-m
tmux send-keys -t morbo:8 "knife ec2 server create 'role[base]' 'role[Seattle]' 'recipe[zenoss::client]' -S mray -I ~/.ssh/mray.pem  -x ubuntu -G default -i ami-a2f405cb -f t1.micro" C-m
tmux send-keys -t morbo:9 "knife ec2 server create 'role[base]' 'role[Seattle]' 'role[ServerSSHLinuxMySQL]' -S mray -I ~/.ssh/mray.pem  -x ubuntu -G default -i ami-a2f405cb -f t1.micro" C-m
tmux attach-session -t morbo
