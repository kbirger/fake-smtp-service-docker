#!/bin/bash
set -e # exit on error

push () {
    package=$1
    echo pushing "$package"
    echo curl --data-binary "@$package" $host/api/charts
    curl --data-binary "@$package" $host/api/charts
}

repo_name=$1


# get the repo url from helm
host=$(helm repo list | grep $repo_name | sed -n -e "s/$repo_name//p" | tr -d [:space:])
echo using Chart Repo: $host

for file in dist/*.tgz
do
    push $file
done

helm repo update $repo_name