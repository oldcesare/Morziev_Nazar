nano count_files.sh
#!/bin/bash

TARGET_DIR="/etc"
FILE_COUNT=0

for item in "$TARGET_DIR"/*; do
    if [ -f "$item" ] && [ ! -L "$item" ]; then
        FILE_COUNT=$((FILE_COUNT + 1))
    fi
done

echo "Number of regular files in $TARGET_DIR: $FILE_COUNT"

