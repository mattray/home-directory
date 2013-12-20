#!/bin/bash

for project in ~/ws/os/*/; do
    cd $project;
    pwd;
    git branch | grep \*;
done
