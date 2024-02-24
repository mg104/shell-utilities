#!/bin/bash
# Shell script to find out if a file across all branches in a git repo, contain a specific string

DEFAULT_SEARCH_STRING="tags_app_id"
DEFAULT_GIT_FILE_LOCATION="./build-178445662108/us-east-1/application/datafile.tfvars"

SEARCH_STRING="${1:-$DEFAULT_SEARCH_STRING}"
GIT_FILE_LOCATION="${2:-$DEFAULT_GIT_FILE_LOCATION}"

echo "Searching for string ${SEARCH_STRING} in the file location ${GIT_FILE_LOCATION} across all branches of git repo."

git for-each-ref --format="%(refname:short)" | while read branch; do
    echo "${branch}"
    echo "$(git rev-list -n 1 ${branch} | git grep "${SEARCH_STRING}" -- "${GIT_FILE_LOCATION}")"
    echo "============================================================================"
done