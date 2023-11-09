#!/bin/bash

# Prompt the user to select a file type
read -p "Please press 1 for Python or 2 for C file: " choice

if [[ "$choice" == "1" ]]; then
    # Check Python files (exclude those with 'main' in their names)
    python_files=$(find . -name "*.py" | grep -v '/main/' | grep -v 'main/')
    
    if [ -n "$python_files" ]; then
        echo "Checking Python files:"
        echo "$python_files" | xargs pycodestyle
        echo "
	***All Python files checked successfully***"
    else
        echo "Error: No Python files (.py) found to be checked."
    fi
elif [[ "$choice" == "2" ]]; then
    # Check C files (exclude those with 'main' in their names)
    c_files=$(find . -name "*.c" | grep -v '/main/' | grep -v 'main/')

    if [ -n "$c_files" ]; then
        echo "Checking C files:"
        echo "$c_files" | xargs betty
        echo "
	***All C files checked successfully***"
    else
        echo "Error: No C files (.c) found to be checked."
    fi
else
    echo "Unsupported choice. Please press 1 for Python or 2 for C."
    exit 1
fi
