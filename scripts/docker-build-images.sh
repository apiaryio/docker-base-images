#!/bin/bash
set -e

echo "CIRCLE_SHA1: $CIRCLE_SHA1"
echo "CIRCLE_BRANCH: $CIRCLE_BRANCH"
echo "REBUILD_ALL: $REBUILD_ALL"
echo "DRY_RUN: $DRY_RUN"

REBUILD_ALL=${REBUILD_ALL:-0}
DRY_RUN=${DRY_RUN:-0}

if [ $REBUILD_ALL != 1 ]; then
    if [ "$CIRCLE_BRANCH" = "master" ]; then
        CHANGED_FILES=`git diff --name-only  $(git log --merges -1 --pretty=format:%P)`
    else
        CHANGED_FILES=`git diff --name-only $(git merge-base origin/master HEAD)`
    fi
    echo "CHANGED_FILES=$CHANGED_FILES"
fi

python ./scripts/build-images.py -a $REBUILD_ALL -f "$CHANGED_FILES" -t "$DRY_RUN"
