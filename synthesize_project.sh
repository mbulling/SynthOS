#!/bin/bash

CONFIG_FILE="synthesis_settings.cfg"

# read from config file
get_config_value() {
    echo $(crudini --get $CONFIG_FILE "$1" "$2")
}

clone_repo() {
    echo "Cloning the repository..."
    git clone $1 project_src
    if [ $? -ne 0 ]; then
        echo "Failed to clone repository."
        exit 1
    fi
}

# use the default demo project
use_default_project() {
    echo "using the default matrix multiplication project..."
}

echo "do you want to use the default matrix multiplication demo project? [y/n]"
read use_default

if [ "$use_default" = "y" ]; then
    use_default_project
    cd project_src
else
    echo "enter the GitHub repository URL to your project code:"
    read repo_url
    clone_repo $repo_url
    repo_name=$(basename $repo_url .git)
    cd $repo_name
fi


# settings from config file
VIVADO_HLS_PATH=$(get_config_value General VivadoHLSPath)
SYNTHESIS_SCRIPT=$(get_config_value Synthesis SynthesisScript)
SYNTHESIS_FLAGS=$(get_config_value Synthesis SynthesisFlags)

# begin synthesis process
if [ -f $SYNTHESIS_SCRIPT ]; then
    echo "Starting synthesis process..."
    $VIVADO_HLS_PATH $SYNTHESIS_SCRIPT $SYNTHESIS_FLAGS
else
    echo "Synthesis script not found: $SYNTHESIS_SCRIPT"
    exit 1
fi
