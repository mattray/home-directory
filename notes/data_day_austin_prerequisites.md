What BigData folks need to know about DevOps
============================================

This talk will provide background on the DevOps movement, the basics of Chef and a hands-on demonstration of the [Cluster Chef](https://github.com/infochimps/cluster_chef/tree/version_2 "Cluster Chef") for launching a working Hadoop cluster from scratch. In preparation for the talk, if you would like to follow along you will need the following prerequisites:

1. Have a working Chef repository. The Chef [How to Get Started](http://help.opscode.com/kb/start/how-to-get-started "How to Get Started") is a perfectly good start. At the end of the tutorial you will have a Chef repository with a working Opscode Platform account and an EC2 account to launch your cluster since that's what we'll be using. We can copy the configuration from this into our Cluster Chef setup for the talk.
2. Check out the Cluster Chef repository from GitHub.  You may either download it from [https://github.com/infochimps/cluster_chef/archives/version_2](https://github.com/infochimps/cluster_chef/archives/version_2 "Download") or check it out with Git. We're using the "version_2" branch which is still under development but targeted at making Cluster Chef more accessible for new users:

    git clone git://github.com/infochimps/cluster_chef.git
    git checkout --track -b version_2 origin/version_2

3. Copy your `.chef` directory from your working repository to your `cluster_chef` directory.
4. Append the following to your `cluster_chef/.chef/.knife.rb`

    cookbook_path ["#{current_dir}/../cookbooks","#{current_dir}/../site-cookbooks"]
    cluster_chef_path "/PATH/TO/cluster_chef"

5. Create a create keypair `demohadoop` in AWS and save it to 

    cluster_chef/.chef/demohadoop.pem

6. Install the `activesupport` gem on your workstation.

    gem install activesupport

This document will continue to be updated until the talk and the slides will be made available for download after the session on the [Opscode Blog](http://opscode.com/blog/ "Opscode Blog") and SlideShare.
