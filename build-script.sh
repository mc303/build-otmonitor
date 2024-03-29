#!/usr/bin/env bash

VERSION=$2

git clone https://github.com/hvxl/otmonitor.git
cd otmonitor

if [[ ${VERSION} != "latest" ]]; then
    git checkout tags/$VERSION
fi

curl https://otgw.tclcode.com/download/sdx-20110317.kit --output sdx.kit
curl https://otgw.tclcode.com/download/tclkit$1 --output tclkit$1

cp tclkit$1 /usr/local/bin/tclkit
chmod +x /usr/local/bin/tclkit

tclkit sdx.kit wrap /data/otmonitor$1 -vfs otmonitor.vfs -runtime tclkit$1
