#!/bin/bash

SUBMODULE=$1

if [[ ! "$SUBMODULE" ]]; then
    echo "No argument provided"
    echo "Usage:"
    echo "fc-remove-submodule.sh a/submodule/dir"
    exit 1
fi

echo "removing submodule: $SUBMODULE"
git submodule deinit -f -- $SUBMODULE
rm -rf .git/modules/$SUBMODULE
git rm --cached $SUBMODULE
