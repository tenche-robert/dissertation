#/bin/bash

echo "Running 'git pull'"
git pull

echo "Updating submodules"
git submodule update --init --remote --recursive


