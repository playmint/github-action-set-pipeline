#!/bin/sh

set -eu

fly -t self login \
	-c "${CONCOURSE_URL}" \
	-u "${CONCOURSE_USERNAME}" \
	-p "${CONCOURSE_PASSWORD}" \
	-n "${CONCOURSE_TEAM}"

OPTIONAL_ARGS=""

if [[ ! -z "${CONCOURSE_PIPELINE_VARS}" ]]; then
	OPTIONAL_ARGS="-l ${GITHUB_WORKSPACE}/${CONCOURSE_PIPELINE_VARS}"
fi

fly -t self set-pipeline \
	--non-interactive \
	-p "${CONCOURSE_PIPELINE_NAME}" \
	-c "${GITHUB_WORKSPACE}/${CONCOURSE_PIPELINE_CONFIG}" \
	${OPTIONAL_ARGS}

if [[ "${CONCOURSE_PIPELINE_PAUSED}" == "false" ]]; then
	fly -t self unpause-pipeline \
		-p "${CONCOURSE_PIPELINE_NAME}"
fi
