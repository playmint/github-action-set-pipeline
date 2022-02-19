#!/bin/sh

set -eu

fly -t self login -c "${CONCOURSE_URL}" -u "${CONCOURSE_USERNAME}" -p "${CONCOURSE_PASSWORD}" -n "${CONCOURSE_TEAM}"
fly -t self "$@"
