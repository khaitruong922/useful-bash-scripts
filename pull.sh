# Pull all the repos in the current directory

#!/bin/bash
cwd=$(pwd)
for i in */.git
do
echo "⌛ Pulling ${i}..."
cd $i/..
git pull --all -q
cd $cwd
echo "✔️  Done: ${i}."
done
