#!/usr/bin/env python3
"""
Document to Markdown converter using markitdown library.
"""

import argparse
import os
from pathlib import Path
from markitdown import MarkItDown

def convert_document(input_path: str, output_path: str) -> None:
    """
    Convert an Office document to Markdown format.

    Args:
        input_path: Path to the input document (e.g., .docx file)
        output_path: Path where the markdown file should be saved
    """
    # Ensure input file exists
    if not os.path.exists(input_path):
        raise FileNotFoundError(f"Input file not found: {input_path}")

    # Create output directory if it doesn't exist
    output_dir = os.path.dirname(output_path)
    if output_dir:
        os.makedirs(output_dir, exist_ok=True)

    # Convert the document
    try:
        # Initialize MarkItDown
        markitdown = MarkItDown()

        # Convert the document
        result = markitdown.convert(input_path)

        # Write the result to the output file
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(result.text_content)

        print(f"Successfully converted {input_path} to {output_path}")
    except Exception as e:
        print(f"Error converting document: {str(e)}")
        raise

def main():
    parser = argparse.ArgumentParser(description="Convert Office documents to Markdown")
    parser.add_argument("input_file", help="Path to the input document (e.g., .docx file)")
    parser.add_argument("output_file", help="Path for the output markdown file")

    args = parser.parse_args()
    convert_document(args.input_file, args.output_file)

if __name__ == "__main__":
    main()
