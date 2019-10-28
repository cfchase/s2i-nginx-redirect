#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

APPLICATION_NAME=${APPLICATION_NAME:-nginx-redirect}

echo "Removing ${APPLICATION_NAME}"

oc process -f ${DIR}/templates/deployment.yml \
  -p REDIRECT_URL="dontcare" \
  | oc delete -f -
