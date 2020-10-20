#!/bin/bash

request_date=$(TZ=GMT date "+%a, %d %h %Y %H:%M:%S %Z")
storage_service_version="2019-12-12"
x_ms_date_h="x-ms-date:$request_date"
x_ms_version_h="x-ms-version:$storage_service_version"
x_ms_blob_type_h="x-ms-blob-type:BlockBlob"

FILE=$1

TOKEN=$(curl -X POST \
  -d "grant_type=client_credentials&client_id=${CLIENTID}&client_secret=${CLIENTSECRET}&resource=https%3A%2F%2Fstorage.azure.com%2F" \
  https://login.microsoftonline.com/${TENANTID}/oauth2/token | jq -r '.access_token')

curl -s -X PUT \
    -T $1 \
    -H "$x_ms_date_h" \
    -H "$x_ms_version_h" \
    -H "$x_ms_blob_type_h" \
    -H "Authorization: Bearer ${TOKEN}" \
    "https://${STORAGEACCOUNT}.blob.core.windows.net/${CONTAINER}/${FILE}"
