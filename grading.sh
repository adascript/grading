#!/bin/bash

url=$1
project=$2
commit=$3
modules="_modules/node_modules"
mods_folder=$project$modules
rm -rf $project
echo "deleting existing $jams folder"
git clone $url $project
echo "copying node_modules into project folder"
cp -R "$mods_folder" "$project"
cd "$project"
if [ -n "$commit" ]; then
  echo "checking out $commit"
  git checkout "$commit"
fi
npm start