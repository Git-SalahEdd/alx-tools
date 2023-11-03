# check all files .c excluding files that contain word "main" on their names
if find . -name "*.c" | grep -v 'main' | xargs betty; then
    echo "All files checked successfully and Following Betty-Style."
else
    echo "Error: No C-file found .c to be checked."
fi
