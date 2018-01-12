#!/bin/bash
find . -name "Dockerfile" -print0 | xargs -0 -n1 dockerlint  -f $1
