#!/usr/bin/env bash

###
# Test script consolidating tests in this repo and it's submodules.
#
# Example calls:
#
#     SUBMODULES_ENABLED=0 ./@bin/test.bash
#     SUBMODULES_ENABLED=1 ./@bin/test.bash
#
###

set -euo pipefail

# detect REPO_DIR - BEGIN
SCRIPT_PATH="$([ -L "$0" ] && readlink "$0" || echo "$0")"
SCRIPT_DIR="$(cd "$(dirname "${SCRIPT_PATH}")" || exit 1; pwd -P)"
REPO_DIR="$(cd "${SCRIPT_DIR}/.." || exit 1; pwd -P)"
# detect REPO_DIR - end

# SUBMODULES_ENABLED - submodules support, if not specified, set to false
SUBMODULES_ENABLED=${SUBMODULES_ENABLED:-0}

echo "Running: ${REPO_DIR}/test/test_content.bats..."
"${REPO_DIR}/test/test_content.bats"

if [ "${SUBMODULES_ENABLED}" = 1 ]; then
  "${REPO_DIR}/refs/repo-l2/@bin/test.bash"
fi
