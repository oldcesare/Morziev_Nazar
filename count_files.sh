#!/bin/bash

count=0

for file in /etc/*; do
    if [ -f "$file" ]; then
        ((count++))
    fi
done

echo "Кількість звичайних файлів у /etc: $count"
