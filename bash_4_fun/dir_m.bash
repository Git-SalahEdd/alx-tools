#!/bin/bash
read -p "name of directory you want to create : " user_input 
mkdir "$user_input" && cd "$user_input" && echo "not empty" > README.md
