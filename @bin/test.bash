#!/usr/bin/env bash

###
# Test script consolidating tests in this repo and it's submodules.
#
# Example calls:
#
#     ./@bin/test.bash
#
###

set -euo pipefail

# detect REPO_DIR - BEGIN
SCRIPT_PATH="$([ -L "$0" ] && readlink "$0" || echo "$0")"
SCRIPT_DIR="$(cd "$(dirname "${SCRIPT_PATH}")" || exit 1; pwd -P)"
REPO_DIR="$(cd "${SCRIPT_DIR}/.." || exit 1; pwd -P)"
# detect REPO_DIR - end

echo "Running: ${REPO_DIR}/test/test_content.bats..."
"${REPO_DIR}/test/test_content.bats"
