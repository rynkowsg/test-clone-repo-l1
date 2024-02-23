#!/usr/bin/env bats

###
# Bats script validating whether repository is correctly
#
#  ./test/test_content.bats
#
###

# detect ROOT_DIR - BEGIN
TEST_DIR="$(cd "$(dirname "${BATS_TEST_FILENAME}")" || exit 1; pwd -P)"
REPO_DIR="$(cd "${TEST_DIR}/.." || exit 1; pwd -P)"
CONTENT_DIR="$(cd "${REPO_DIR}/content" || exit 1; pwd -P)"
# detect ROOT_DIR - end

@test "[l1] Content is correct: regular-file.txt " {
  content="$(cat "${CONTENT_DIR}/regular-file.txt")"
  expected_value="This is regular file."
  [ "${expected_value}" == "${content}" ]
}
