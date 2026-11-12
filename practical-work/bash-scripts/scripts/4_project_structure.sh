#!/bin/bash
dir="${1:-my-project}"
mkdir -p "$dir/css" "$dir/js"
cat > "$dir/index.html" <<'HTML'
<!DOCTYPE html><html><head><meta charset="utf-8"><title>My Project</title><link rel="stylesheet" href="css/style.css"></head><body><h1>Hello</h1><script src="js/script.js"></script></body></html>
HTML
echo "body{font-family:sans-serif;}" > "$dir/css/style.css"
echo "console.log('ready');" > "$dir/js/script.js"
echo "Created structure in $dir:"; find "$dir" | sort
