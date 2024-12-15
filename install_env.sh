#!/bin/bash

# Environment name
CONDA_ENV_NAME="doc-to-md"
PYTHON_VERSION="3.13"

# Check if conda is available
if ! command -v conda &> /dev/null; then
    echo "Error: conda is not installed or not in PATH"
    echo "Please install Conda first: https://docs.conda.io/en/latest/miniconda.html"
    exit 1
fi

# Create conda environment if it doesn't exist
if ! conda env list | grep -q "^$CONDA_ENV_NAME "; then
    echo "Creating new conda environment: $CONDA_ENV_NAME"
    conda create -n "$CONDA_ENV_NAME" python="$PYTHON_VERSION" -y
else
    echo "Conda environment '$CONDA_ENV_NAME' already exists"
fi

# Activate the environment
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate "$CONDA_ENV_NAME"

# Install requirements
echo "Installing Python dependencies..."
pip install -r requirements.txt

echo "Environment setup complete!"
echo "To activate the environment, run: conda activate $CONDA_ENV_NAME"
