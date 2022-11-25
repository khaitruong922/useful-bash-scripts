# Clean all local branches of all repos in the directory.

#!/bin/bash
cwd=$(pwd)
repos=$(find . -maxdepth 5 -type d -name "*.git")
for i in $repos
do
    echo "🧹 Cleaning local branches of ${i}..."
    cd $i/..
    branch=$(git symbolic-ref --short -q HEAD)
    echo "Current branch: ${branch}"
    git checkout dev -q || git checkout develop -q || git checkout main -q || git checkout master -q
    git branch | grep -v "develop" | grep -v "main" | grep -v "master" | xargs git branch -D
    echo "✔️  Done: ${i}."
    git checkout $branch -q
    cd $cwd
done
