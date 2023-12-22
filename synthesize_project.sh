#!/bin/bash

# prompt user to enter github repo containing c/c++ code to be synthesized
echo "Enter the GitHub repository URL:"
read repo_url

# clone repo onto the machine
echo "Cloning the repository..."
git clone $repo_url

# cd into project directory
repo_name=$(basename $repo_url .git)
cd $repo_name

# begin synthesis process
if [ -f run_synthesis.sh ]; then
    echo "starting synthesis process..."
    chmod +x run_synthesis.sh
    ./run_synthesis.sh
else
    echo "error with synthesis script"
    exit 1
fi
