#!/bin/bash

CONFIG_FILE="synthesis_settings.cfg"

# function to read value from config file
get_config_value() {
    echo $(crudini --get $CONFIG_FILE "$1" "$2")
}

# prompt user to enter github repo containing c/c++ code to be synthesized
echo "Enter the GitHub repository URL:"
read repo_url

# clone repo onto the machine
echo "Cloning the repository..."
git clone $repo_url

# cd into project directory
repo_name=$(basename $repo_url .git)
cd $repo_name

# read settings from config file
VIVADO_HLS_PATH=$(get_config_value General VivadoHLSPath)
SYNTHESIS_SCRIPT=$(get_config_value Synthesis SynthesisScript)
SYNTHESIS_FLAGS=$(get_config_value Synthesis SynthesisFlags)

# begin synthesis process
if [ -f $SYNTHESIS_SCRIPT ]; then
    echo "starting synthesis process..."
    $VIVADO_HLS_PATH $SYNTHESIS_SCRIPT $SYNTHESIS_FLAGS
else
    echo "synthesis script not found: $SYNTHESIS_SCRIPT"
    exit 1
fi
