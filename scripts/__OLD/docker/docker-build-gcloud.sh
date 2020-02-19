#!/bin/bash
set -x

if [[ -z "${PROJECT_ID}" ]]; then
    echo "### ERROR: Please set PROJECT_ID" >&2
    exit 1;
fi

version=$(node -e "var pj=require('./package.json'); console.log(\`\${pj.version}\`)");

docker build \
    -t gcr.io/${PROJECT_ID}/sbpro-node:latest \
    -t gcr.io/${PROJECT_ID}/sbpro-node:$version \
    .