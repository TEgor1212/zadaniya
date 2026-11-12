#!/bin/bash
ext="${1:-sh}"
echo "Files with extension .$ext in current directory:"
find . -maxdepth 1 -type f -name "*.${ext}" -print | sort
