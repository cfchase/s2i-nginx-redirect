#!/usr/bin/env /bin/sh

SOURCE_REPOSITORY_URL=${SOURCE_REPOSITORY_URL:-https://github.com/cfchase/s2i-nginx-redirect.git}
SOURCE_REPOSITORY_REF=${SOURCE_REPOSITORY_REF:-master}
SOURCE_REPOSITORY_DIR=${SOURCE_REPOSITORY_DIR:-/}
IMAGE_REPOSITORY=${IMAGE_REPOSITORY:-cfchase/nginx-redirect:latest}

echo "Building ${IMAGE_REPOSITORY} from local"

s2i build ${SOURCE_REPOSITORY_URL} --ref ${SOURCE_REPOSITORY_REF} --context-dir ${SOURCE_REPOSITORY_DIR} centos/nginx-114-centos7 ${IMAGE_REPOSITORY}
