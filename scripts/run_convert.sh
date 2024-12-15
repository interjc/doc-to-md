#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$( cd "$SCRIPT_DIR/.." && pwd )"

# Source the environment activation script
source "$SCRIPT_DIR/activate_env.sh"

# Check if we have the correct number of arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_file> <output_file>"
    echo "Example: $0 input.docx output.md"
    exit 1
fi

INPUT_FILE="$1"
OUTPUT_FILE="$2"

# Convert paths to absolute if they're relative
if [[ ! "$INPUT_FILE" = /* ]]; then
    INPUT_FILE="$PWD/$INPUT_FILE"
fi

if [[ ! "$OUTPUT_FILE" = /* ]]; then
    OUTPUT_FILE="$PWD/$OUTPUT_FILE"
fi

# Run the Python converter script
python "$PROJECT_ROOT/python/converter.py" "$INPUT_FILE" "$OUTPUT_FILE"
