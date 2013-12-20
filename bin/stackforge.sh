#!/bin/bash

for project in ~/ws/os/*/; do
    cd $project;
    pwd;
    git fetch origin;
    git fetch stackforge;
    git stash;
    git co master;
    git pull --rebase stackforge master;
    git co -;
    git co stable/grizzly;
    git pull --rebase stackforge stable/grizzly;
    git push origin master;
    git co -;
    git stash pop;
done
