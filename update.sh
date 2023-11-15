#!/bin/bash

# exit when any command fails
set -e

new_ver=$1

echo "update version: $new_ver"

# Create temporary folder
tmp_dir=$(mktemp -d)
echo $tmp_dir

# Clone GitHub repo
git clone git@github.com:pblgllgs/argocd-tutorial.git $tmp_dir

# Update image tag
sed -i -e "s/pblgllgs\/pod:.*/pblgllgs\/pod:$new_ver/g" $tmp_dir/my-app/1-deployment.yaml

# Commit and push
cd $tmp_dir
git add .
git commit -m "Update image to $new_ver"
git push

# Optionally on build agents - remove folder
rm -rf $tmp_dir