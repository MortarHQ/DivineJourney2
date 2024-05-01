#!/bin/bash
find . -size +50M -type f -exec ls -lh {} \; | awk '{ print $9 }' >large_files.txt

# clear the gitattributes
echo "" >.gitattributes

while IFS= read -r file; do
    git lfs track "$file"
done <large_files.txt
