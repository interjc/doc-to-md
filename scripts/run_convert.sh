#!/bin/bash

# 获取此脚本所在的目录
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$( cd "$SCRIPT_DIR/.." && pwd )"

# 引入环境激活脚本
source "$SCRIPT_DIR/activate_env.sh"

# 检查参数数量是否正确
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_file> <output_file>"
    echo "Example: $0 input.docx output.md"
    exit 1
fi

INPUT_FILE="$1"
OUTPUT_FILE="$2"

# 如果路径是相对的，则转换为绝对路径
if [[ ! "$INPUT_FILE" = /* ]]; then
    INPUT_FILE="$PWD/$INPUT_FILE"
fi

if [[ ! "$OUTPUT_FILE" = /* ]]; then
    OUTPUT_FILE="$PWD/$OUTPUT_FILE"
fi

# 运行 Python 转换器脚本
python "$PROJECT_ROOT/python/converter.py" "$INPUT_FILE" "$OUTPUT_FILE"
