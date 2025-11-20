#!/usr/bin/env bash

set -euo pipefail

if [ -z "${DOCKER_IMAGE:-}" ]; then
  echo ":boom: \$DOCKER_IMAGE missing" 1>&2
  exit 1
fi

manifest="$(mktemp)"

echo '--- :kubernetes: Current Context'

envsubst < k8s/deployment.yml > "${manifest}"
kubectl config current-context
echo '--- :zzz: End of jobs'
