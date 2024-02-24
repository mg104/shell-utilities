#!/bin/bash

FOLDER_NAME="GDAP-EMRCREATOR-INSTANCEFLEET"

for bucket in $(aws s3 ls | awk '{print $3}'); do
    # if echo "${bucket}" | grep "us-east-dev-corp"; then
        if aws s3 ls "s3://${bucket}/" | grep " ${FOLDER_NAME}/" > /dev/null; then
            echo "Folder ${FOLDER_NAME} found in ${bucket}"
        fi
    # fi
done
