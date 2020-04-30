#!/usr/bin/env bash
set +o pipefail
find . -name "Dockerfile" -print0 | xargs -0 -n1 dockerlint -f $1
set -o pipefail
