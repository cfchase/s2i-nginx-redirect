#!/usr/bin/env bash

APPLICATION_NAME=${APPLICATION_NAME:-nginx-redirect}

echo "Rolling out new version of redirect"
oc rollout latest dc/${APPLICATION_NAME}