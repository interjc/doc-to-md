# Document to Markdown Converter

## 简介

本项目基于 [markitdown](https://github.com/microsoft/markitdown/) 库，实现将 Office 文档（如 .docx）转换为 Markdown 文件的功能。
项目提供一套 Python 脚本和对应的 Shell 脚本，方便在本地快速运行转换流程。

## 目录结构

```
project_root/
├─ README.md
├─ requirements.txt
├─ install_env.sh
├─ python/
│  ├─ converter.py
│  └─ __init__.py
└─ scripts/
   ├─ run_convert.sh
   └─ activate_env.sh
```

- `install_env.sh`：通过 conda 创建并安装所需环境和依赖的脚本。
- `requirements.txt`：Python 依赖清单，包括 markitdown 等第三方库。
- `python/converter.py`：核心转换逻辑脚本，使用 markitdown 将 Office 文档转为 Markdown。
- `scripts/run_convert.sh`：执行 shell 脚本，用于激活环境并调用 `converter.py`。
- `scripts/activate_env.sh`：激活 conda 虚拟环境的辅助脚本。

## 环境准备

1. 确保已安装 [conda](https://docs.conda.io/en/latest/)。
2. 在项目根目录下运行：
   ```bash
   chmod +x install_env.sh
   ./install_env.sh
   ```
   脚本将创建并激活 conda 环境，然后安装 `requirements.txt` 中的依赖。

## 使用方法

1. 准备输入文件（如：`input.docx`）。
2. 执行脚本：
   ```bash
   ./scripts/run_convert.sh input.docx output.md
   ```
   - 脚本将会自动激活对应的 conda 环境，并调用 `converter.py` 完成转换。
   - 执行完成后，`output.md` 即为转换结果。

## 流程图

```mermaid
flowchart TD

A[用户运行 run_convert.sh] --> B[run_convert.sh 脚本启动]
B --> C[激活 conda 环境]
C --> D[解析用户输入参数(输入文件, 输出文件)]
D --> E[调用 converter.py 并传参]
E --> F[converter.py 使用 markitdown 转换文档]
F --> G[输出 Markdown 文件]
G --> H[完成并返回结果]
```

## 常见问题

- **Q:** 如果没装 conda 怎么办？
  **A:** 请参考 [conda 官方文档](https://docs.conda.io/en/latest/) 安装 conda 后再执行 `install_env.sh`。

- **Q:** 如何添加新的依赖？
  **A:** 修改 `requirements.txt` 后重新执行 `install_env.sh` 更新环境。

## 参考资料

- [markitdown 项目地址](https://github.com/microsoft/markitdown/)
