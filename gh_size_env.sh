#!/usr/bin/env bash

{
  echo "GH_EVENT_PR=$GH_EVENT_PR"
  echo "GH_EVENT_HASH=$GH_EVENT_HASH"
  echo "GH_EVENT_BASE=$GH_EVENT_BASE"

  MERGE_PARENT="$(git --no-pager log -1 --pretty=tformat:%s | sed -n -e 's/Merge [0-9a-f]\+ into //p')"
  if [[ -z "${MERGE_PARENT}" || "${GH_EVENT_PR}" == 0 ]]
  then
    MERGE_PARENT=$GH_EVENT_BASE
  fi
  echo "GH_EVENT_PARENT=$MERGE_PARENT"
} >>"$GITHUB_ENV"
