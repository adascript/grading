#!/bin/bash

url=$1
project=$2
commit=$3
extension=".git"
full_url=$url$extension
modules="_modules/node_modules"
mods_folder=$project$modules
grading_folder="~/dev/bloc/grading/"
rm -rf $project
echo "deleting existing $jams folder"
git clone $full_url $project
echo "copying node_modules into project folder"
cp -R "$mods_folder" "$project"
cd "$project"
subl $grading_folder$project
if [ -n "$commit" ]; then
  echo "checking out $commit"
  git checkout "$commit"
fi
npm start