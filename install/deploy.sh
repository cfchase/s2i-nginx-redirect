#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

APPLICATION_NAME=${APPLICATION_NAME:-nginx-redirect}
ROUTE_NAME=${ROUTE_NAME:-redirect}
REPLICAS=${REPLICAS:-1}
IMAGE_REPOSITORY=${IMAGE_REPOSITORY:-cfchase/nginx-redirect:latest}

echo "Deploying ${APPLICATION_NAME} using ${IMAGE_REPOSITORY}"

oc process -f ${DIR}/templates/deployment.yml \
  -p APPLICATION_NAME=${APPLICATION_NAME} \
  -p REPLICAS=${REPLICAS} \
  -p IMAGE_REPOSITORY=${IMAGE_REPOSITORY} \
  -p REDIRECT_URL=${REDIRECT_URL} \
  -p ROUTE_NAME=${ROUTE_NAME} \
  | oc create -f -
