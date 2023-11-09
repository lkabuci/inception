#!/bin/bash

echo "Check Dockerfiles healths..."
dockerfiles=$(find . -type f -name Dockerfile -print)
for dockerfile in "$dockerfiles"; do
    echo "checking: $dockerfile"
    hadolint "$dockerfile"
    if [ "$?" != 0 ]; then
        exit 1;
    fi
done

