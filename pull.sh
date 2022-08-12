# Pull all the repos in the current directory

#!/bin/bash
cwd=$(pwd)
repos=$(find . -maxdepth 5 -type d -name "*.git")
for i in $repos
do
    echo "⌛ Pulling ${i}..."
    cd $i/..
    git pull --all -q
    cd $cwd
    echo "✔️  Done: ${i}."
done
