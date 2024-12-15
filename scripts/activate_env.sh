#!/bin/bash

# Initialize conda for the shell session
CONDA_PATH="$(conda info --base)"
source "$CONDA_PATH/etc/profile.d/conda.sh"

# Activate the Conda environment
CONDA_ENV_NAME="doc-to-md"

# Try to activate the environment
if ! conda activate "$CONDA_ENV_NAME" 2>/dev/null; then
    echo "Error: Could not activate conda environment '$CONDA_ENV_NAME'"
    echo "Please make sure you have run install_env.sh first"
    exit 1
fi

echo "Successfully activated conda environment: $CONDA_ENV_NAME"
