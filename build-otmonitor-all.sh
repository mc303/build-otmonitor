#!/usr/bin/env bash

VERSION=$2
DOWNLOADURL='https://otgw.tclcode.com/download'

git clone https://github.com/hvxl/otmonitor.git
cd otmonitor
git checkout tags/${VERSION}

curl ${DOWNLOADURL}/sdx-20110317.kit --output sdx.kit
# curl https://otgw.tclcode.com/download/tclkit${PLATFORM}  --output tclkit${PLATFORM}
# curl https://otgw.tclcode.com/download/tclkit${PLATFORM}  --output tclkit${PLATFORM}
# curl https://otgw.tclcode.com/download/tclkit${PLATFORM}  --output tclkit${PLATFORM}
# curl https://otgw.tclcode.com/download/tclkit${PLATFORM}  --output tclkit${PLATFORM}

curl ${DOWNLOADURL}/tclkit --output tclkit
curl ${DOWNLOADURL}/tclkit-x64 --output tclkit-x64
curl ${DOWNLOADURL}/tclkit-ahf --output tclkit-ahf
curl ${DOWNLOADURL}/tclkit-aarch64 --output tclkit-aarch64
curl ${DOWNLOADURL}/tclkit.exe --output tclkit.exe

cp tclkit /usr/local/bin/tclkit
cp tclkit-x64 /usr/local/bin/tclkit-x64
cp tclkit-ahf /usr/local/bin/tclkit-ahf
cp tclkit-aarch64 /usr/local/bin/tclkit-aarch64
cp tclkit.exe /usr/local/bin/tclkit.exe
chmod +x /usr/local/bin/tclkit
chmod +x /usr/local/bin/tclkit-x64

tclkit-x64 sdx.kit wrap otmonitor -vfs otmonitor.vfs -runtime tclkit
tclkit-x64 sdx.kit wrap otmonitor-x64 -vfs otmonitor.vfs -runtime tclkit-x64
tclkit-x64 sdx.kit wrap otmonitor-ahf -vfs otmonitor.vfs -runtime tclkit-ahf
tclkit-x64 sdx.kit wrap otmonitor-aarch64 -vfs otmonitor.vfs -runtime tclkit-aarch64
tclkit-x64 sdx.kit wrap otmonitor.exe -vfs otmonitor.vfs -runtime tclkit.exe

