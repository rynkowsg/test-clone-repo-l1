#!/usr/bin/env bats

###
# Bats script validating whether repository is correctly
#
#  LFS_ENABLED=1 ./test/test_content.bats
#  LFS_ENABLED=0 ./test/test_content.bats
#
###

# detect ROOT_DIR - BEGIN
TEST_DIR="$(cd "$(dirname "${BATS_TEST_FILENAME}")" || exit 1; pwd -P)"
REPO_DIR="$(cd "${TEST_DIR}/.." || exit 1; pwd -P)"
CONTENT_DIR="$(cd "${REPO_DIR}/content" || exit 1; pwd -P)"
# detect ROOT_DIR - end

# LFS_ENABLED - Git LFS support, if not specified, set to false
LFS_ENABLED=${LFS_ENABLED:-0}

@test "[l1] Content is correct: regular-file.txt " {
  content="$(cat "${CONTENT_DIR}/regular-file.txt")"
  expected_value="This is regular file."
  [ "${expected_value}" == "${content}" ]
}

@test "[l1] Content is correct: lfs-file.txt " {
  content="$(cat "${CONTENT_DIR}/lfs-file.ltxt")"
  if [ "${LFS_ENABLED}" = 1 ]; then
    expected_content="This is super large file."
    [ "${expected_content}" == "${content}" ]
  else
    expected_line_in_file="version https://git-lfs.github.com/spec/v1"
    echo "${content}" | grep -qF "${expected_line_in_file}"
  fi
}
