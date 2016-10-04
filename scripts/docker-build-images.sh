#!/bin/bash

echo "CIRCLE_COMPARE_URL: $CIRCLE_COMPARE_URL"
echo "REBUILD_ALL: $REBUILD_ALL"
echo "DRY_RUN: $DRY_RUN"

if [[ -z "$CIRCLE_COMPARE_URL" || "$REBUILD_ALL" ]]; then
    REBUILD_ALL=1
else
    if [[ $CIRCLE_COMPARE_URL =~ compare\/([0-9a-f\^\~]+)\.\.\.([0-9a-f]+)$ ]]; then
        SHA1=${BASH_REMATCH[1]}
        SHA2=${BASH_REMATCH[2]}
        REBUILD_ALL=0
    elif [[ $CIRCLE_COMPARE_URL =~ commit\/([0-9a-f\^\~]+)$ ]]; then
        SHA1="master"
        SHA2=${BASH_REMATCH[1]}
        REBUILD_ALL=0
    else
        echo "Couldn't parse CIRCLE_COMPARE_URL ($CIRCLE_COMPARE_URL), rebuilding all images"
        REBUILD_ALL=1
    fi
fi

if [ $REBUILD_ALL == 0 ]; then
    CHANGED_FILES=`git diff --name-only $SHA1 $SHA2`
fi

python ./scripts/build-images.py -a $REBUILD_ALL -f "$CHANGED_FILES" -t "$DRY_RUN"
EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ]; then
    exit $EXIT_CODE
fi

echo "All done!"
